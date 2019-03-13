package net.atos.tfc.app.pageflow.test.integration;

import net.atos.tfc.app.pageflow.test.generate.Row;
import net.atos.tfc.app.pageflow.test.util.PageFlowMapper;
import net.atos.tfc.app.pageflow.test.util.Sql;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class PageFlowDriver
{
    public static final String SQL_WEBSITE_ID = "SELECT website_id FROM CFG_WEBSITE where name = :name";

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public PageFlowDriver(DataSource dataSource)
    {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
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
}
