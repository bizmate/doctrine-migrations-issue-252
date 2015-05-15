<?php
/**
 * Created by PhpStorm.
 * User: dgullo
 * Date: 20/02/2015
 * Time: 13:51
 */

/**
 * Command line script to run Migrations
 * Inspired by phar-cli-stup.php
 */

require(__DIR__ . '/../vendor/autoload.php');

use Symfony\Component\Console;
use Doctrine\DBAL\Migrations\MigrationsVersion;
use Doctrine\DBAL\Migrations\Tools\Console\Command as MigrationsCommand;

$dbParams = require(__DIR__.'/../migrations-db.php');
#require(__DIR__ . '/../vendor/autoload.php');

// Set current directory to application root so we can find config files
chdir(__DIR__ . '/..');

// Instantiate console application
$cli = new Console\Application('Doctrine Migrations', MigrationsVersion::VERSION());
//$cli = new Console\Application('Doctrine Migrations', MigrationsVersion::VERSION);
$cli->setCatchExceptions(true);

$db = \Doctrine\DBAL\DriverManager::getConnection($dbParams);
#var_dump($db);die;
$platform = $db->getDatabasePlatform();
$platform->registerDoctrineTypeMapping('enum', 'string');

$helperSet = new Console\Helper\HelperSet();
$connectionHelper = new \Doctrine\DBAL\Tools\Console\Helper\ConnectionHelper($db);

$helperSet->set( $connectionHelper, 'db');
$helperSet->set(new Console\Helper\DialogHelper(), 'dialog');

$cli->setHelperSet($helperSet);

// Add Migrations commands
$commands = array();
$commands[] = new MigrationsCommand\DiffCommand();
$commands[] = new MigrationsCommand\ExecuteCommand();
$commands[] = new MigrationsCommand\GenerateCommand();
$commands[] = new MigrationsCommand\LatestCommand();
$commands[] = new MigrationsCommand\MigrateCommand();
$commands[] = new MigrationsCommand\StatusCommand();
$commands[] = new MigrationsCommand\VersionCommand();

// remove the "migrations:" prefix on each command name
foreach ($commands as $command) {
    $command->setName(str_replace('migrations:', '', $command->getName()));
}
$cli->addCommands($commands);
//var_dump($cli->getHelperSet());die;
// Run!
$cli->run();

