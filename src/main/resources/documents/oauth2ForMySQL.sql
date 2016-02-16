---------------------------------------------

CREATE SCHEMA `OAUT2-SECURITY-SERVICE` ;

---------------------------------------------

CREATE TABLE `ClientDetails` (
  `appId` varchar(256) NOT NULL,
  `resourceIds` varchar(256) DEFAULT NULL,
  `appSecret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `grantTypes` varchar(256) DEFAULT NULL,
  `redirectUrl` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additionalInformation` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---------------------------------------------

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `ix_auth_username` (`username`,`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` VALUES ('marissa','ROLE_USER'),('paul','ROLE_USER');

---------------------------------------------

CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---------------------------------------------

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oauth_client_details` VALUES ('my-client-with-registered-redirect',NULL,NULL,'read,trust','authorization_code,client_credentials','http://anywhere?key=value','ROLE_CLIENT',NULL,NULL,NULL),
                                          ('my-client-with-secret',NULL,'secret','read','client_credentials',NULL,'ROLE_CLIENT',NULL,NULL,NULL),
                                          ('my-less-trusted-autoapprove-client',NULL,NULL,'read,write,trust','implicit',NULL,'ROLE_CLIENT',NULL,NULL,NULL),
                                          ('my-less-trusted-client',NULL,NULL,NULL,'authorization_code,implicit',NULL,'ROLE_CLIENT',NULL,NULL,NULL),
                                          ('my-trusted-client',NULL,NULL,'read,write,trust','password,authorization_code,refresh_token,implicit',NULL,'ROLE_CLIENT, ROLE_TRUSTED_CLIENT',60,NULL,NULL),
                                          ('my-trusted-client-with-secret',NULL,'somesecret','read,write,trust','password,authorization_code,refresh_token,implicit',NULL,'ROLE_CLIENT, ROLE_TRUSTED_CLIENT',NULL,NULL,NULL),
                                          ('my-untrusted-client-with-registered-redirect',NULL,NULL,'read','authorization_code','http://anywhere','ROLE_CLIENT',NULL,NULL,NULL),
                                          ('tonr','sparklr','secret','read,write','authorization_code,implicit,refresh_token',NULL,'ROLE_CLIENT, ROLE_TRUSTED_CLIENT',NULL,NULL,NULL);

---------------------------------------------

CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---------------------------------------------

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---------------------------------------------

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES ('marissa','koala',1),('paul','kangaroo',1);