<?php

namespace Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20150414181642 extends AbstractMigration
{
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $this->addSql("
            CREATE TABLE `ows_cache` (
              `id` char(32) NOT NULL,
              `hotel_code` char(6) NOT NULL,
              `date_in_ts` int(11) unsigned NOT NULL,
              `date_out_ts` int(11) unsigned NOT NULL,
              `rate_plan_code` varchar(32) NOT NULL,
              `summary_only` tinyint(1) unsigned NOT NULL,
              `num_rooms` tinyint(1) unsigned NOT NULL,
              `response` text,
              `created` int(11) unsigned NOT NULL,
              `expire` int(11) unsigned DEFAULT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8
        ");
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql('DROP TABLE ows_cache');
    }
}
