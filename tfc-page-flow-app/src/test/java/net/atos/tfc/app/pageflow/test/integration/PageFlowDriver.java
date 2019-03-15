package net.atos.tfc.app.pageflow.test.integration;

import net.atos.tfc.app.pageflow.test.generate.Row;
import net.atos.tfc.app.pageflow.test.generate.Website;
import net.atos.tfc.app.pageflow.test.util.PageFlowMapper;
import net.atos.tfc.app.pageflow.test.util.Sql;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.nio.file.Path;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PageFlowDriver
{
    public static final String SQL_WEBSITE_ID = "SELECT website_id FROM CFG_WEBSITE where name = :name";

    private NamedParameterJdbcTemplate jdbcTemplate;
    private Path scriptDirectory;

    public PageFlowDriver(DataSource dataSource, Path scriptDirectory)
    {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        this.scriptDirectory=scriptDirectory;
    }

    public Long getWebsiteId(String websiteName)
    {
        MapSqlParameterSource paramSource = new MapSqlParameterSource();
        paramSource.addValue("name", websiteName);

        return jdbcTemplate.queryForObject(SQL_WEBSITE_ID, paramSource, Long.class);
    }

    public List<Row> findPageFlows(String fromPage, Long fromWebsiteID, String action)
    {
        String sql = Sql.readSQL("src/test/resources/when.sql");

        MapSqlParameterSource paramSource = new MapSqlParameterSource();
        paramSource.addValue("fromPage", fromPage);
        paramSource.addValue("fromWebsiteID", fromWebsiteID);
        paramSource.addValue("action", action);
        return jdbcTemplate.query(sql, paramSource, new PageFlowMapper());
    }

    public List<Row> findPageFlows(Long fromWebsiteID)
    {
        String sql = Sql.readSQL(scriptDirectory.resolve("cfg_page_flow.sql").toAbsolutePath().toString());

        MapSqlParameterSource paramSource = new MapSqlParameterSource();
        paramSource.addValue("website_id", fromWebsiteID);

        return jdbcTemplate.query(sql, paramSource, new PageFlowMapper());
    }

    public List<Website> getWebsites()
    {
        return jdbcTemplate.query("select website_id, name from CFG_WEBSITE", new RowMapper<Website>()
        {
            @Nullable
            @Override
            public Website mapRow(ResultSet resultSet, int i) throws SQLException
            {
                return new Website(resultSet.getLong("website_id"), resultSet.getString("name"));
            }
        });
    }
}

