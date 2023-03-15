-- Adminer 4.8.1 MySQL 5.7.41 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `sp_datasource`;
CREATE TABLE `sp_datasource` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `driver_class_name` varchar(255) DEFAULT NULL,
  `jdbc_url` varchar(255) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sp_datasource` (`id`, `name`, `driver_class_name`, `jdbc_url`, `username`, `password`, `create_date`) VALUES
('3a553242ecb4a2a326bde6b59bcb023e',	'mysql',	'com.mysql.jdbc.Driver',	'jdbc:mysql://mysql:3306/spiderflow?useSSL=false&useUnicode=true&characterEncoding=UTF8&autoReconnect=true',	'root',	'369258',	'2023-03-14 10:06:05');

DROP TABLE IF EXISTS `sp_flow`;
CREATE TABLE `sp_flow` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '任务名字',
  `xml` longtext COMMENT 'xml表达式',
  `cron` varchar(255) DEFAULT NULL COMMENT 'corn表达式',
  `enabled` char(1) DEFAULT '0' COMMENT '任务是否启动,默认未启动',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_execute_time` datetime DEFAULT NULL COMMENT '上一次执行时间',
  `next_execute_time` datetime DEFAULT NULL COMMENT '下一次执行时间',
  `execute_count` int(8) DEFAULT NULL COMMENT '定时执行的已执行次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='爬虫任务表';

INSERT INTO `sp_flow` (`id`, `name`, `xml`, `cron`, `enabled`, `create_date`, `last_execute_time`, `next_execute_time`, `execute_count`) VALUES
('971da7db2c224deeb4eabb35d74ce9bc',	'www.npr.org',	'<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;www.npr.org&quot;,&quot;submit-strategy&quot;:&quot;random&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"定义变量\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"210\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;定义变量&quot;,&quot;loopVariableName&quot;:&quot;topic_index&quot;,&quot;variable-name&quot;:[&quot;domain&quot;,&quot;subject&quot;,&quot;topics&quot;,&quot;topic&quot;],&quot;variable-description&quot;:[&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;],&quot;loopCount&quot;:&quot;9&quot;,&quot;variable-value&quot;:[&quot;https://www.npr.org&quot;,&quot;english&quot;,&quot;${[&#39;1001&#39;,&#39;1002&#39;,&#39;1003&#39;,&#39;1004&#39;,&#39;1006&#39;,&#39;1007&#39;,&#39;1008&#39;,&#39;1009&#39;,&#39;1010&#39;]}&quot;,&quot;${topics[topic_index]}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"开始抓取\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"360\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;开始抓取&quot;,&quot;loopVariableName&quot;:&quot;page&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;retryCount&quot;:&quot;&quot;,&quot;retryInterval&quot;:&quot;&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;1000&quot;,&quot;url&quot;:&quot;${domain}/get/${topic}/render/partial/next?start=${25*page}&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:&quot;&quot;,&quot;follow-redirect&quot;:&quot;1&quot;,&quot;tls-validate&quot;:&quot;1&quot;,&quot;cookie-auto-set&quot;:&quot;1&quot;,&quot;repeat-enable&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"2\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"3\" target=\"4\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"定义变量\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"490\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;定义变量&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;article_links&quot;],&quot;variable-description&quot;:[&quot;&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${resp.xpaths(&#39;//h2[@class=\\&quot;title\\&quot;]/a/@href&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"4\" target=\"7\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"9\" value=\"遍历文章链接\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"620\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;遍历文章链接&quot;,&quot;loopVariableName&quot;:&quot;article_links_index&quot;,&quot;variable-name&quot;:[&quot;article_link&quot;],&quot;variable-description&quot;:[&quot;&quot;],&quot;loopCount&quot;:&quot;${article_links.length()}&quot;,&quot;variable-value&quot;:[&quot;${article_links[article_links_index]}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"10\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"7\" target=\"9\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"13\" value=\"开始抓取\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"780\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;开始抓取&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;retryCount&quot;:&quot;&quot;,&quot;retryInterval&quot;:&quot;&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;${article_link}&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:&quot;&quot;,&quot;follow-redirect&quot;:&quot;1&quot;,&quot;tls-validate&quot;:&quot;1&quot;,&quot;cookie-auto-set&quot;:&quot;1&quot;,&quot;repeat-enable&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"14\" value=\"去重\" style=\"strokeWidth=2;strokeColor=blue;sharp=1;\" parent=\"1\" source=\"9\" target=\"13\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;去重&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;blue&quot;,&quot;condition&quot;:&quot;${ article_link != null &amp;&amp; mongodb.mongodb.spider.count({&#39;url&#39;: article_link}) &lt; 1 }&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"15\" value=\"定义变量\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"940\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;定义变量&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;title&quot;,&quot;content&quot;,&quot;published_datetime&quot;,&quot;published_at&quot;,&quot;author&quot;,&quot;introduction&quot;],&quot;variable-description&quot;:[&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${resp.selector(&#39;h1&#39;).text()}&quot;,&quot;${resp.selectors(&#39;div .storytext p&#39;).texts().join(&#39;\\\\n\\\\n&#39;)}&quot;,&quot;${resp.xpath(&#39;//div[@class=\\&quot;dateblock\\&quot;]/time/@datetime&#39;)}&quot;,&quot;${date.parse(string.replaceAll(published_datetime, &#39;[A-Za-z\\\\+]+&#39;, &#39; &#39;).trim().substring(0, 16) + &#39;:00&#39;)}&quot;,&quot;${resp.xpaths(&#39;//p[@class=\\&quot;byline__name byline__name--block\\&quot;]/a/text()&#39;).join(&#39;, &#39;)}&quot;,&quot;${null}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"16\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"13\" target=\"15\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"17\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"1070\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;datasourceId&quot;:&quot;223bdd3a87d56ede7f3f7375b15bacf5&quot;,&quot;tableName&quot;:&quot;&quot;,&quot;csvName&quot;:&quot;&quot;,&quot;csvEncoding&quot;:&quot;GBK&quot;,&quot;output-name&quot;:[&quot;author&quot;,&quot;published_at&quot;,&quot;published_datetime&quot;,&quot;title&quot;,&quot;article_link&quot;,&quot;content&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;output-value&quot;:[&quot;${author}&quot;,&quot;${published_at}&quot;,&quot;${published_datetime}&quot;,&quot;${title}&quot;,&quot;${article_link}&quot;,&quot;${content}&quot;],&quot;output-all&quot;:&quot;0&quot;,&quot;output-database&quot;:&quot;0&quot;,&quot;output-csv&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"18\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"15\" target=\"17\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"19\" value=\"写入数据库\" style=\"function\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"940\" y=\"190\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;写入数据库&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;function&quot;:[&quot;${mongodb.mongodb.spider.insert({&#39;title&#39; : title, &#39;subject&#39;: subject, &#39;source&#39;: domain, &#39;url&#39;: article_link, &#39;introduction&#39; : introduction, &#39;content&#39;: content, &#39;author&#39;: author, &#39;published_at&#39;: published_at, &#39;created_at&#39;: date.now()})}&quot;],&quot;shape&quot;:&quot;function&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"20\" value=\"执行结束\" style=\"forkJoin\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"1050\" y=\"190\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;执行结束&quot;,&quot;shape&quot;:&quot;forkJoin&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"21\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"19\" target=\"20\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"28\" value=\"\" style=\"strokeWidth=2;strokeColor=blue;sharp=1;\" parent=\"1\" source=\"15\" target=\"19\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\">\n        <mxPoint x=\"900\" y=\"130\" as=\"sourcePoint\"/>\n        <Array as=\"points\"/>\n      </mxGeometry>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;blue&quot;,&quot;condition&quot;:&quot;${title!=null &amp;&amp; content!= null &amp;&amp; title.length() &gt; 0 &amp;&amp; content.length() &gt; 0}&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"29\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"490\" y=\"174\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;datasourceId&quot;:&quot;223bdd3a87d56ede7f3f7375b15bacf5&quot;,&quot;tableName&quot;:&quot;&quot;,&quot;csvName&quot;:&quot;&quot;,&quot;csvEncoding&quot;:&quot;GBK&quot;,&quot;output-name&quot;:[&quot;article_links&quot;,&quot;url&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;output-value&quot;:[&quot;${article_links}&quot;,&quot;${domain}/get/${topic}/render/partial/next?start=${25*page}&quot;],&quot;output-all&quot;:&quot;0&quot;,&quot;output-database&quot;:&quot;0&quot;,&quot;output-csv&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"31\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"7\" target=\"29\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n',	NULL,	'0',	'2023-03-15 06:37:28',	NULL,	NULL,	NULL),
('f0a67f17ee1a498a9b2f4ca30556f3c3',	'抓取每日菜价',	'<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;抓取每日菜价&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"开始抓取\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"219.83334350585938\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;开始抓取&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;http://www.beijingprice.cn:8086/price/priceToday/PageLoad/LoadPrice?jsoncallback=1&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:[&quot;&quot;],&quot;follow-redirect&quot;:&quot;1&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"\" parent=\"1\" source=\"2\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"解析JSON\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"350\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;解析JSON&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;jsonstr&quot;,&quot;jsondata&quot;,&quot;data&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${string.substring(resp.html,2,resp.html.length()-1)}&quot;,&quot;${json.parse(jsonstr)}&quot;,&quot;${extract.jsonpath(jsondata[0],&#39;data&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" parent=\"1\" source=\"3\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"480.16668701171875\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;i&quot;,&quot;output-name&quot;:[&quot;菜名&quot;,&quot;菜价&quot;,&quot;单位&quot;],&quot;loopCount&quot;:&quot;${list.length(data)}&quot;,&quot;output-value&quot;:[&quot;${data[i].ItemName}&quot;,&quot;${data[i].Price04}&quot;,&quot;${data[i].ItemUnit}&quot;],&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" parent=\"1\" source=\"5\" target=\"7\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n',	NULL,	'0',	'2019-08-22 13:48:22',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `sp_flow_notice`;
CREATE TABLE `sp_flow_notice` (
  `id` varchar(32) NOT NULL,
  `recipients` varchar(200) DEFAULT NULL COMMENT '收件人',
  `notice_way` char(10) DEFAULT NULL COMMENT '通知方式',
  `start_notice` char(1) DEFAULT '0' COMMENT '流程开始通知:1:开启通知,0:关闭通知',
  `exception_notice` char(1) DEFAULT '0' COMMENT '流程异常通知:1:开启通知,0:关闭通知',
  `end_notice` char(1) DEFAULT '0' COMMENT '流程结束通知:1:开启通知,0:关闭通知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='爬虫任务通知表';


DROP TABLE IF EXISTS `sp_function`;
CREATE TABLE `sp_function` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '函数名',
  `parameter` varchar(512) DEFAULT NULL COMMENT '参数',
  `script` text COMMENT 'js脚本',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `sp_mongo`;
CREATE TABLE `sp_mongo` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `alias` varchar(32) DEFAULT NULL,
  `host` varchar(64) DEFAULT NULL,
  `port` int(6) DEFAULT NULL,
  `database` varchar(64) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sp_mongo` (`id`, `name`, `alias`, `host`, `port`, `database`, `username`, `password`, `create_date`) VALUES
('5b4acf48047fe36382ceb5203b570f77',	'mongo',	'mongo',	'mongo',	27017,	'admin',	'root',	'369258',	'2023-03-15 06:43:31');

DROP TABLE IF EXISTS `sp_redis`;
CREATE TABLE `sp_redis` (
  `id` varchar(32) NOT NULL,
  `host` varchar(64) DEFAULT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `port` int(6) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `db_index` int(6) DEFAULT NULL,
  `max_connections` int(6) DEFAULT NULL,
  `max_idle` int(6) DEFAULT NULL,
  `min_idle` int(6) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sp_redis` (`id`, `host`, `alias`, `name`, `port`, `password`, `db_index`, `max_connections`, `max_idle`, `min_idle`, `create_date`) VALUES
('2594dd0896ed1bd63850cfe8560b9066',	'redis',	'redis',	'redis',	6379,	'',	0,	8,	8,	0,	'2023-03-15 06:48:29');

DROP TABLE IF EXISTS `sp_task`;
CREATE TABLE `sp_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` varchar(32) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `sp_variable`;
CREATE TABLE `sp_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '变量名',
  `value` varchar(512) DEFAULT NULL COMMENT '变量值',
  `description` varchar(255) DEFAULT NULL COMMENT '变量描述',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 2023-03-15 06:50:26
