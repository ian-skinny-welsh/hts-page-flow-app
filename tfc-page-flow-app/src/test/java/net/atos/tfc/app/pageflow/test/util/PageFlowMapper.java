package net.atos.tfc.app.pageflow.test.util;

import net.atos.tfc.app.pageflow.test.generate.Row;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.lang.Nullable;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class PageFlowMapper implements RowMapper<Row>
{
    @Nullable
    @Override
    public Row mapRow(ResultSet resultSet, int i) throws SQLException
    {
        Row row = new Row();
        row.setWebsiteID(resultSet.getLong(1));
        row.setFromUri(resultSet.getString(2));
        row.setFromName(resultSet.getString(3));
        row.setToID(resultSet.getString(4));
        row.setToName(resultSet.getString(5));
        row.setOption(resultSet.getString(6));
        row.setRule(Optional.ofNullable(resultSet.getString(7)).orElse(""));
        row.setAction(resultSet.getString(8));
        row.setToWebsite(resultSet.getString(9));
        row.setToURI(resultSet.getString(10));
        return row;

    }
}
