package site.namsu.sweng.base;

import site.namsu.sweng.rx.function.Consumer;
import site.namsu.sweng.rx.function.Function;

import java.sql.*;
import java.util.Collections;
import java.util.List;
import java.util.Vector;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-03 오전 10:31
 * @Homepage : https://github.com/gusdnd852
 */

@SuppressWarnings("unchecked")
public class Accessor {

    private List<Consumer<PreparedStatement>> params;
    private Function<ResultSet, Object> mapper;
    private String query;

    public static final String id = "root";
    public static final String pw = "gusdnd852";
    public static final String url = "jdbc:mysql://localhost:3306/mingus?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";

    protected Accessor SQL(String sql) {
        this.params = new Vector<>();
        this.query = sql;
        return this;
    }

    public Accessor param(Consumer<PreparedStatement> param) {
        if (query == null) throw new NullPointerException("No Query");
        else params.add(param);
        return this;
    }

    private boolean isParameterError() {
        int countQuestionMarks = 0;
        for (char character : query.toCharArray())
            if (character == '?') countQuestionMarks++;
        return countQuestionMarks != params.size();
    }

    public Accessor map(Function<ResultSet, Object> mapper) {
        if (query == null) throw new NullPointerException("No Query");
        else this.mapper = mapper;
        return this;
    }


    public <Output> Output getOnce(Class<Output> type) {
        if (query == null) throw new NullPointerException("No Query");
        else if (isParameterError())
            throw new IllegalArgumentException("Please call 'param' method for the number of question marks in the PreparedStatement.");
        else try (Connection connection = DriverManager.getConnection(url, id, pw);
                  PreparedStatement statement = connection.prepareStatement(query)) {
                for (Consumer<PreparedStatement> param : params) param.accept(statement);
                try (ResultSet set = statement.executeQuery()) {
                    if (set.next()) return (Output) mapper.apply(set);
                    else return type.isInstance(Boolean.FALSE)
                            ? (Output) Boolean.FALSE
                            : type.isInstance(0)
                            ? (Output) Integer.valueOf(0)
                            : null;
                }
            } catch (Exception e) {
                return type.isInstance(Boolean.FALSE)
                        ? (Output) Boolean.FALSE
                        : type.isInstance(0)
                        ? (Output) Integer.valueOf(0)
                        : null;
            } finally {
                query = null;
                params = null;
                mapper = null;
            }
    }

    public <Type> List<Type> getList(Class<Type> genericType) {
        if (query == null) throw new NullPointerException("No Query");
        else if (isParameterError())
            throw new IllegalArgumentException("Please call 'param' method for the number of question marks in the PreparedStatement.");
        else try (Connection connection = DriverManager.getConnection(url, id, pw);
                  PreparedStatement statement = connection.prepareStatement(query)) {
                for (Consumer<PreparedStatement> param : params) param.accept(statement);
                try (ResultSet set = statement.executeQuery()) {
                    if (set.next()) {
                        List<Type> list = new Vector<>();
                        do list.add((Type) mapper.apply(set));
                        while (set.next());
                        return list;
                    } else return null;
                }
            } catch (Exception e) {
                return null;
            } finally {
                query = null;
                params = null;
                mapper = null;
            }
    }

    public boolean set() {
        if (query == null) throw new NullPointerException("No Query");
        else if (isParameterError())
            throw new IllegalArgumentException("Please call the 'param' method for the number of question marks in the PreparedStatement.");
        else try (Connection connection = DriverManager.getConnection(url, id, pw);
                  PreparedStatement statement = connection.prepareStatement(query)) {
                for (Consumer<PreparedStatement> param : params) param.accept(statement);
                statement.executeUpdate();
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            } finally {
                query = null;
                params = null;
            }
    }
}
