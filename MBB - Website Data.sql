/*
Request is to create a table and import pageview data out of the web analytics tool.
*/
CREATE TABLE website_pageview(
	website_pageview_id BIGINT,
    created_at DATETIME,
    website_session_id BIGINT,
    pageview_url VARCHAR(50),
    PRIMARY KEY (website_pageview_id)
)


