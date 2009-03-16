CREATE TABLE `clips` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `location` varchar(255) default NULL,
  `creator` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `info` varchar(255) default NULL,
  `annotation` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `tracklists` (
  `id` int(11) NOT NULL auto_increment,
  `playlist_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tracks` (
  `id` int(11) NOT NULL auto_increment,
  `playlist_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `creator` varchar(255) default NULL,
  `location` varchar(255) default NULL,
  `info` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `identifier` varchar(255) default NULL,
  `album` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `playlist_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO schema_info (version) VALUES (6)