-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Okt 2024 pada 05.04
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ks`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1728729227),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1728729227;', 1728729227),
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1728730999),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1728730998;', 1728730999);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '2ae5de3e-ad68-4294-b6d8-a812bbf9dcb8', 'database', 'default', '{\"uuid\":\"2ae5de3e-ad68-4294-b6d8-a812bbf9dcb8\",\"displayName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\HandleNotificationJob\\\":0:{}\"}}', 'ErrorException: Trying to access array offset on value of type null in D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php:26\nStack trace:\n#0 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#1 D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#2 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(23): Midtrans\\Notification->__construct()\n#3 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(18): App\\Services\\Midtrans\\CallBackNotif->_handleNotification()\n#4 D:\\task-ks\\app\\Jobs\\HandleNotificationJob.php(31): App\\Services\\Midtrans\\CallBackNotif->__construct()\n#5 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\HandleNotificationJob->handle()\n#6 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#7 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#8 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#11 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#12 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#13 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\HandleNotificationJob), false)\n#15 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#16 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#17 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\HandleNotificationJob))\n#19 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#20 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#21 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#22 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#25 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#26 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#31 D:\\task-ks\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 D:\\task-ks\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\task-ks\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\task-ks\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 D:\\task-ks\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#39 {main}', '2024-10-11 05:29:26'),
(2, 'a0599b48-f087-499c-a1d6-788885f249e1', 'database', 'default', '{\"uuid\":\"a0599b48-f087-499c-a1d6-788885f249e1\",\"displayName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\HandleNotificationJob\\\":0:{}\"}}', 'ErrorException: Trying to access array offset on value of type null in D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php:26\nStack trace:\n#0 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#1 D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#2 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(23): Midtrans\\Notification->__construct()\n#3 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(18): App\\Services\\Midtrans\\CallBackNotif->_handleNotification()\n#4 D:\\task-ks\\app\\Jobs\\HandleNotificationJob.php(31): App\\Services\\Midtrans\\CallBackNotif->__construct()\n#5 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\HandleNotificationJob->handle()\n#6 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#7 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#8 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#11 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#12 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#13 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\HandleNotificationJob), false)\n#15 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#16 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#17 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\HandleNotificationJob))\n#19 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#20 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#21 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#22 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#25 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#26 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#31 D:\\task-ks\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 D:\\task-ks\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\task-ks\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\task-ks\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 D:\\task-ks\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#39 {main}', '2024-10-11 05:30:21'),
(3, '07a05e48-7300-4f15-8d99-d81e25f121f6', 'database', 'default', '{\"uuid\":\"07a05e48-7300-4f15-8d99-d81e25f121f6\",\"displayName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\HandleNotificationJob\\\":2:{s:16:\\\"\\u0000*\\u0000callbacknotif\\\";O:35:\\\"App\\\\Services\\\\Midtrans\\\\CallBackNotif\\\":6:{s:12:\\\"\\u0000*\\u0000serverKey\\\";s:38:\\\"SB-Mid-server-w3zjNfu8DIt73ZktlFb7JzXl\\\";s:15:\\\"\\u0000*\\u0000isProduction\\\";b:0;s:14:\\\"\\u0000*\\u0000isSanitized\\\";b:1;s:8:\\\"\\u0000*\\u0000is3ds\\\";b:1;s:15:\\\"\\u0000*\\u0000notification\\\";O:21:\\\"Midtrans\\\\Notification\\\":1:{s:31:\\\"\\u0000Midtrans\\\\Notification\\u0000response\\\";O:8:\\\"stdClass\\\":15:{s:11:\\\"status_code\\\";s:3:\\\"407\\\";s:14:\\\"transaction_id\\\";s:36:\\\"c36bc675-9a2d-4d61-b4dc-27d45eaa59d3\\\";s:12:\\\"gross_amount\\\";s:10:\\\"3301826.00\\\";s:8:\\\"currency\\\";s:3:\\\"IDR\\\";s:8:\\\"order_id\\\";s:13:\\\"67079dbe67a1e\\\";s:12:\\\"payment_type\\\";s:13:\\\"bank_transfer\\\";s:13:\\\"signature_key\\\";s:128:\\\"d9a10f089ac4a52b05d19c22370a73e8fe103e98f8ed98a0d4db88f5a54ab6d9b77e32f6cd7a9a0e8b547101861247450dd27ecefd5d8c31bc3011991e02805f\\\";s:18:\\\"transaction_status\\\";s:6:\\\"expire\\\";s:12:\\\"fraud_status\\\";s:6:\\\"accept\\\";s:14:\\\"status_message\\\";s:29:\\\"Success, transaction is found\\\";s:11:\\\"merchant_id\\\";s:10:\\\"G113095353\\\";s:10:\\\"va_numbers\\\";a:1:{i:0;O:8:\\\"stdClass\\\":2:{s:4:\\\"bank\\\";s:3:\\\"bca\\\";s:9:\\\"va_number\\\";s:11:\\\"95353921450\\\";}}s:15:\\\"payment_amounts\\\";a:0:{}s:16:\\\"transaction_time\\\";s:19:\\\"2024-10-10 16:26:51\\\";s:11:\\\"expiry_time\\\";s:19:\\\"2024-10-11 16:26:51\\\";}}s:8:\\\"\\u0000*\\u0000order\\\";N;}s:12:\\\"\\u0000*\\u0000transaksi\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";N;s:2:\\\"id\\\";a:0:{}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}}\"}}', 'ErrorException: Trying to access array offset on value of type null in D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php:26\nStack trace:\n#0 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#1 D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#2 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(23): Midtrans\\Notification->__construct()\n#3 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(18): App\\Services\\Midtrans\\CallBackNotif->_handleNotification()\n#4 D:\\task-ks\\app\\Jobs\\HandleNotificationJob.php(31): App\\Services\\Midtrans\\CallBackNotif->__construct()\n#5 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\HandleNotificationJob->handle()\n#6 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#7 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#8 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#11 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#12 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#13 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\HandleNotificationJob), false)\n#15 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#16 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#17 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\HandleNotificationJob))\n#19 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#20 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#21 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#22 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#25 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#26 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#31 D:\\task-ks\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 D:\\task-ks\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\task-ks\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\task-ks\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 D:\\task-ks\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#39 {main}', '2024-10-11 05:43:12'),
(4, '57979378-ce36-42a6-9b86-cce70f33f325', 'database', 'default', '{\"uuid\":\"57979378-ce36-42a6-9b86-cce70f33f325\",\"displayName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\HandleNotificationJob\\\":2:{s:16:\\\"\\u0000*\\u0000callbacknotif\\\";O:35:\\\"App\\\\Services\\\\Midtrans\\\\CallBackNotif\\\":6:{s:12:\\\"\\u0000*\\u0000serverKey\\\";s:38:\\\"SB-Mid-server-w3zjNfu8DIt73ZktlFb7JzXl\\\";s:15:\\\"\\u0000*\\u0000isProduction\\\";b:0;s:14:\\\"\\u0000*\\u0000isSanitized\\\";b:1;s:8:\\\"\\u0000*\\u0000is3ds\\\";b:1;s:15:\\\"\\u0000*\\u0000notification\\\";O:21:\\\"Midtrans\\\\Notification\\\":1:{s:31:\\\"\\u0000Midtrans\\\\Notification\\u0000response\\\";O:8:\\\"stdClass\\\":14:{s:16:\\\"transaction_time\\\";s:19:\\\"2024-10-11 19:45:52\\\";s:12:\\\"gross_amount\\\";s:9:\\\"650000.00\\\";s:8:\\\"currency\\\";s:3:\\\"IDR\\\";s:8:\\\"order_id\\\";s:13:\\\"67091dfcb286a\\\";s:12:\\\"payment_type\\\";s:4:\\\"qris\\\";s:13:\\\"signature_key\\\";s:128:\\\"e9cbeb9e376a3de883ba359e4d03207065582bfc0a55e53f54ada2f419e5276b4a7f7ca59aa84082795ac1f4e60c6756fa53f04c48227bde543f153a4aefeb50\\\";s:11:\\\"status_code\\\";s:3:\\\"201\\\";s:14:\\\"transaction_id\\\";s:36:\\\"0b4368cf-7868-44fc-aa9e-3b93e8a95d25\\\";s:18:\\\"transaction_status\\\";s:7:\\\"pending\\\";s:12:\\\"fraud_status\\\";s:6:\\\"accept\\\";s:11:\\\"expiry_time\\\";s:19:\\\"2024-10-11 20:00:52\\\";s:14:\\\"status_message\\\";s:29:\\\"Success, transaction is found\\\";s:11:\\\"merchant_id\\\";s:10:\\\"G113095353\\\";s:8:\\\"acquirer\\\";s:5:\\\"gopay\\\";}}s:8:\\\"\\u0000*\\u0000order\\\";N;}s:12:\\\"\\u0000*\\u0000transaksi\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"App\\\\Models\\\\TransaksiFinal\\\";s:2:\\\"id\\\";a:1:{i:0;i:12;}s:9:\\\"relations\\\";a:2:{i:0;s:9:\\\"keranjang\\\";i:1;s:16:\\\"keranjang.produk\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'ErrorException: Trying to access array offset on value of type null in D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php:26\nStack trace:\n#0 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#1 D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#2 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(23): Midtrans\\Notification->__construct()\n#3 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(18): App\\Services\\Midtrans\\CallBackNotif->_handleNotification()\n#4 D:\\task-ks\\app\\Jobs\\HandleNotificationJob.php(31): App\\Services\\Midtrans\\CallBackNotif->__construct()\n#5 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\HandleNotificationJob->handle()\n#6 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#7 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#8 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#11 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#12 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#13 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\HandleNotificationJob), false)\n#15 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#16 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#17 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\HandleNotificationJob))\n#19 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#20 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#21 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#22 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#25 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#26 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#31 D:\\task-ks\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 D:\\task-ks\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\task-ks\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\task-ks\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 D:\\task-ks\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#39 {main}', '2024-10-11 05:45:54'),
(5, '9d6950bd-9756-4b9f-8654-4fa69182d676', 'database', 'default', '{\"uuid\":\"9d6950bd-9756-4b9f-8654-4fa69182d676\",\"displayName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\HandleNotificationJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\HandleNotificationJob\\\":2:{s:16:\\\"\\u0000*\\u0000callbacknotif\\\";O:35:\\\"App\\\\Services\\\\Midtrans\\\\CallBackNotif\\\":6:{s:12:\\\"\\u0000*\\u0000serverKey\\\";s:38:\\\"SB-Mid-server-w3zjNfu8DIt73ZktlFb7JzXl\\\";s:15:\\\"\\u0000*\\u0000isProduction\\\";b:0;s:14:\\\"\\u0000*\\u0000isSanitized\\\";b:1;s:8:\\\"\\u0000*\\u0000is3ds\\\";b:1;s:15:\\\"\\u0000*\\u0000notification\\\";O:21:\\\"Midtrans\\\\Notification\\\":1:{s:31:\\\"\\u0000Midtrans\\\\Notification\\u0000response\\\";O:8:\\\"stdClass\\\":17:{s:16:\\\"transaction_time\\\";s:19:\\\"2024-10-11 19:45:52\\\";s:12:\\\"gross_amount\\\";s:9:\\\"650000.00\\\";s:8:\\\"currency\\\";s:3:\\\"IDR\\\";s:8:\\\"order_id\\\";s:13:\\\"67091dfcb286a\\\";s:12:\\\"payment_type\\\";s:4:\\\"qris\\\";s:13:\\\"signature_key\\\";s:128:\\\"8b513598b7fb0bf5765b8151597ef7c3854b0070f1341f806a56d94e53cb7ebe42a48617b6db01ee0e1823ba6b24da489f66cf12ff066d70243255017f4eec3a\\\";s:11:\\\"status_code\\\";s:3:\\\"200\\\";s:14:\\\"transaction_id\\\";s:36:\\\"0b4368cf-7868-44fc-aa9e-3b93e8a95d25\\\";s:18:\\\"transaction_status\\\";s:10:\\\"settlement\\\";s:12:\\\"fraud_status\\\";s:6:\\\"accept\\\";s:11:\\\"expiry_time\\\";s:19:\\\"2024-10-11 20:00:52\\\";s:15:\\\"settlement_time\\\";s:19:\\\"2024-10-11 19:46:09\\\";s:14:\\\"status_message\\\";s:29:\\\"Success, transaction is found\\\";s:11:\\\"merchant_id\\\";s:10:\\\"G113095353\\\";s:16:\\\"transaction_type\\\";s:5:\\\"on-us\\\";s:6:\\\"issuer\\\";s:5:\\\"gopay\\\";s:8:\\\"acquirer\\\";s:5:\\\"gopay\\\";}}s:8:\\\"\\u0000*\\u0000order\\\";N;}s:12:\\\"\\u0000*\\u0000transaksi\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"App\\\\Models\\\\TransaksiFinal\\\";s:2:\\\"id\\\";a:1:{i:0;i:12;}s:9:\\\"relations\\\";a:2:{i:0;s:9:\\\"keranjang\\\";i:1;s:16:\\\"keranjang.produk\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'ErrorException: Trying to access array offset on value of type null in D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php:26\nStack trace:\n#0 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#1 D:\\task-ks\\vendor\\midtrans\\midtrans-php\\Midtrans\\Notification.php(26): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Trying to acces...\', \'D:\\\\task-ks\\\\vend...\', 26)\n#2 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(23): Midtrans\\Notification->__construct()\n#3 D:\\task-ks\\app\\Services\\Midtrans\\CallBackNotif.php(18): App\\Services\\Midtrans\\CallBackNotif->_handleNotification()\n#4 D:\\task-ks\\app\\Jobs\\HandleNotificationJob.php(31): App\\Services\\Midtrans\\CallBackNotif->__construct()\n#5 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\HandleNotificationJob->handle()\n#6 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#7 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#8 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#11 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#12 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#13 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\HandleNotificationJob), false)\n#15 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#16 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\HandleNotificationJob))\n#17 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\HandleNotificationJob))\n#19 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#20 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#21 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#22 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#25 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#26 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#31 D:\\task-ks\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 D:\\task-ks\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\task-ks\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\task-ks\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 D:\\task-ks\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 D:\\task-ks\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#39 {main}', '2024-10-11 05:46:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategoris`
--

INSERT INTO `kategoris` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', '2024-10-10 19:44:13', '2024-10-10 19:44:13'),
(2, 'Elektronik', '2024-10-10 19:44:37', '2024-10-10 19:44:37'),
(3, 'Hp', '2024-10-10 19:44:43', '2024-10-10 19:44:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjangs`
--

CREATE TABLE `keranjangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profil_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Sudah Checkout','Belum Checkout') NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keranjangs`
--

INSERT INTO `keranjangs` (`id`, `produk_id`, `profil_id`, `status`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Sudah Checkout', 1, '2024-10-10 19:50:01', '2024-10-11 00:33:15'),
(3, 4, 1, 'Sudah Checkout', 1, '2024-10-10 19:50:34', '2024-10-11 00:13:37'),
(4, 4, 1, 'Sudah Checkout', 1, '2024-10-11 00:14:09', '2024-10-11 00:14:09'),
(5, 4, 1, 'Sudah Checkout', 1, '2024-10-11 00:18:19', '2024-10-11 00:50:07'),
(6, 4, 1, 'Sudah Checkout', 2, '2024-10-11 00:21:12', '2024-10-11 00:50:07'),
(7, 3, 1, 'Sudah Checkout', 1, '2024-10-11 00:51:42', '2024-10-11 00:51:53'),
(8, 4, 1, 'Sudah Checkout', 1, '2024-10-11 00:52:59', '2024-10-11 00:52:59'),
(9, 4, 1, 'Sudah Checkout', 1, '2024-10-11 01:34:04', '2024-10-11 05:45:49'),
(10, 3, 1, 'Sudah Checkout', 1, '2024-10-11 05:50:48', '2024-10-11 05:50:48'),
(11, 5, 2, 'Sudah Checkout', 1, '2024-10-11 08:35:28', '2024-10-11 08:35:28'),
(12, 5, 2, 'Sudah Checkout', 1, '2024-10-11 08:37:41', '2024-10-11 08:39:47'),
(14, 4, 2, 'Sudah Checkout', 2, '2024-10-11 08:39:06', '2024-10-11 08:39:47'),
(15, 5, 2, 'Sudah Checkout', 3, '2024-10-11 08:41:37', '2024-10-11 08:41:37'),
(16, 3, 3, 'Sudah Checkout', 2, '2024-10-11 17:54:47', '2024-10-11 17:54:47'),
(17, 4, 3, 'Sudah Checkout', 1, '2024-10-11 17:57:02', '2024-10-11 17:59:11'),
(18, 5, 3, 'Sudah Checkout', 1, '2024-10-11 17:57:18', '2024-10-11 17:59:11'),
(20, 4, 3, 'Sudah Checkout', 1, '2024-10-11 17:58:30', '2024-10-11 17:59:11'),
(21, 4, 3, 'Sudah Checkout', 1, '2024-10-11 17:59:55', '2024-10-11 18:00:21'),
(22, 4, 3, 'Sudah Checkout', 1, '2024-10-11 18:00:00', '2024-10-11 18:00:21'),
(23, 5, 3, 'Sudah Checkout', 1, '2024-10-11 18:00:10', '2024-10-11 18:00:21'),
(25, 4, 4, 'Sudah Checkout', 1, '2024-10-12 03:43:04', '2024-10-12 03:43:04'),
(27, 5, 4, 'Sudah Checkout', 1, '2024-10-12 03:46:48', '2024-10-12 03:49:05'),
(29, 4, 2, 'Sudah Checkout', 2, '2024-10-12 03:48:35', '2024-10-12 03:49:05'),
(30, 4, 2, 'Sudah Checkout', 1, '2024-10-12 03:53:46', '2024-10-12 03:53:46'),
(31, 4, 2, 'Sudah Checkout', 1, '2024-10-12 03:55:04', '2024-10-12 03:55:04'),
(32, 3, 4, 'Sudah Checkout', 1, '2024-10-12 04:06:10', '2024-10-12 04:06:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_07_065337_create_profils_table', 1),
(5, '2024_10_07_065341_create_kategoris_table', 1),
(6, '2024_10_07_065344_create_produks_table', 1),
(7, '2024_10_07_065346_create_transaksis_table', 1),
(8, '2024_10_07_065348_create_keranjangs_table', 1),
(9, '2024_10_07_065349_create_transaksi_finals_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `stok` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `foto_produk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produks`
--

INSERT INTO `produks` (`id`, `nama_produk`, `kategori_id`, `harga`, `deskripsi`, `stok`, `is_active`, `foto_produk`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Laptop A409JP Black', 1, 4500000, 'Laptop gaming', 4, 1, '01J9WRTDES7JMZNAQ0ZVXRHWD5.jfif', '2024-10-10 20:09:10', '2024-10-12 03:38:13', NULL),
(4, 'RAM 64GB', 2, 650000, 'Ram gaming', 10, 1, '01J9WRW23HJ8TQZKWFHR2QQ7DT.jpg', '2024-10-10 20:10:04', '2024-10-12 04:03:22', NULL),
(5, 'Proccesor i7 GEN 11', 2, 250000, 'Prosesor Gaming', 9, 1, '01J9Y38X2XB93SZGEWG43K6KBH.jfif', '2024-10-11 08:31:05', '2024-10-12 03:49:55', NULL),
(8, 'POCO X3 NFC', 3, 1850000, 'Hp Gaming', 5, 1, '01JA04KN7134BBRYPYZHXX95KT.jfif', '2024-10-12 03:32:55', '2024-10-12 03:38:22', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profils`
--

CREATE TABLE `profils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` bigint(20) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `profils`
--

INSERT INTO `profils` (`id`, `name`, `alamat`, `no_hp`, `foto_profil`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'jokerrs', 'Surakarta', 85156078295, 'profile_photos/Lo5oj4VKmYCaglSH8rXzRWS8AgcTUVG5B2V7Spuf.jpg', 2, '2024-10-10 19:49:04', '2024-10-10 20:58:29'),
(2, 'joekr', 'N/A', NULL, NULL, 3, '2024-10-11 08:33:17', '2024-10-11 09:35:44'),
(3, 'Krisna Joko Purjianto', NULL, NULL, NULL, 4, '2024-10-11 17:48:27', '2024-10-11 17:48:27'),
(4, 'Krisna Joko', NULL, NULL, NULL, 5, '2024-10-12 03:40:31', '2024-10-12 03:40:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profil_id` bigint(20) UNSIGNED NOT NULL,
  `total_transaksi` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksis`
--

INSERT INTO `transaksis` (`id`, `profil_id`, `total_transaksi`, `created_at`, `updated_at`) VALUES
(8, 1, 650000, '2024-10-11 00:13:34', '2024-10-11 00:13:34'),
(9, 1, 650000, '2024-10-11 00:14:09', '2024-10-11 00:14:09'),
(10, 1, 650000, '2024-10-11 00:18:19', '2024-10-11 00:18:19'),
(11, 1, 5150000, '2024-10-11 00:33:14', '2024-10-11 00:33:14'),
(14, 1, 1300000, '2024-10-11 00:49:09', '2024-10-11 00:49:09'),
(15, 1, 1300000, '2024-10-11 00:50:06', '2024-10-11 00:50:06'),
(16, 1, 4500000, '2024-10-11 00:51:53', '2024-10-11 00:51:53'),
(17, 1, 650000, '2024-10-11 00:52:59', '2024-10-11 00:52:59'),
(18, 1, 650000, '2024-10-11 05:45:47', '2024-10-11 05:45:47'),
(19, 1, 4500000, '2024-10-11 05:50:48', '2024-10-11 05:50:48'),
(20, 2, 1250000, '2024-10-11 08:35:28', '2024-10-11 08:35:28'),
(21, 2, 1900000, '2024-10-11 08:39:46', '2024-10-11 08:39:46'),
(22, 2, 1250000, '2024-10-11 08:41:37', '2024-10-11 08:41:37'),
(23, 3, 4500000, '2024-10-11 17:54:47', '2024-10-11 17:54:47'),
(24, 3, 2550000, '2024-10-11 17:59:10', '2024-10-11 17:59:10'),
(26, 3, 2550000, '2024-10-11 18:00:20', '2024-10-11 18:00:20'),
(27, 3, 650000, '2024-10-12 03:43:04', '2024-10-12 03:43:04'),
(28, 4, 900000, '2024-10-12 03:49:03', '2024-10-12 03:49:03'),
(29, 4, 650000, '2024-10-12 03:53:46', '2024-10-12 03:53:46'),
(30, 3, 650000, '2024-10-12 03:55:04', '2024-10-12 03:55:04'),
(31, 4, 4500000, '2024-10-12 04:06:10', '2024-10-12 04:06:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_finals`
--

CREATE TABLE `transaksi_finals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `transaksi_id` bigint(20) UNSIGNED NOT NULL,
  `keranjang_id` bigint(20) UNSIGNED NOT NULL,
  `status_pembayaran` enum('Belum Lunas','Lunas','Pending','Transaksi Kadaluarsa','Transaksi Dibatalkan') NOT NULL,
  `snap_token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_finals`
--

INSERT INTO `transaksi_finals` (`id`, `order_id`, `transaksi_id`, `keranjang_id`, `status_pembayaran`, `snap_token`, `created_at`, `updated_at`) VALUES
(1, '6708d01e6acfa', 8, 3, 'Belum Lunas', '28035cb5-1d9c-4092-8a42-79d7b3367198', '2024-10-11 00:13:37', '2024-10-11 00:13:37'),
(2, '6708d040ce216', 9, 4, 'Lunas', 'f33bc851-fd8d-4f3f-9895-05ef7b852ab4', '2024-10-11 00:14:10', '2024-10-11 00:14:58'),
(3, '6708d13b2e947', 10, 5, 'Lunas', '645015e7-ebc9-4f5b-b60f-b7889ffd8e59', '2024-10-11 00:18:19', '2024-10-11 00:18:38'),
(4, '6708d4ba2a21b', 11, 1, 'Transaksi Kadaluarsa', '39fbbe73-2ef0-4f73-b498-0b76bf0faa85', '2024-10-11 00:33:14', '2024-10-11 01:12:12'),
(5, '6708d4ba2a21b', 11, 6, 'Transaksi Kadaluarsa', '39fbbe73-2ef0-4f73-b498-0b76bf0faa85', '2024-10-11 00:33:14', '2024-10-11 01:12:12'),
(6, '6708d875507ac', 14, 5, 'Lunas', '01bc93cb-d5e9-420b-bda2-fda55366f54e', '2024-10-11 00:49:09', '2024-10-11 00:54:53'),
(7, '6708d875507ac', 14, 6, 'Lunas', '01bc93cb-d5e9-420b-bda2-fda55366f54e', '2024-10-11 00:49:10', '2024-10-11 00:54:53'),
(8, '6708d8ae955f8', 15, 5, 'Lunas', '8520eecf-8494-4e0b-a8c4-0c2be7dd1960', '2024-10-11 00:50:07', '2024-10-11 00:50:57'),
(9, '6708d8ae955f8', 15, 6, 'Lunas', '8520eecf-8494-4e0b-a8c4-0c2be7dd1960', '2024-10-11 00:50:07', '2024-10-11 00:50:57'),
(10, '6708d9192d219', 16, 7, 'Lunas', '747afb70-47ab-4004-9c66-865bc7e0e2d3', '2024-10-11 00:51:53', '2024-10-11 00:52:11'),
(11, '6708d95b0f40c', 17, 8, 'Belum Lunas', 'dc3e1f0c-efc0-455d-8248-a46e80e7c7c9', '2024-10-11 00:53:00', '2024-10-11 00:53:00'),
(12, '67091dfcb286a', 18, 9, 'Belum Lunas', '35cdf13e-b6e1-40ae-8951-ada5cc72d3fd', '2024-10-11 05:45:49', '2024-10-11 05:45:49'),
(13, '67091f2791908', 19, 10, 'Lunas', 'ccf0440a-9355-4ee1-81d3-418d208326a5', '2024-10-11 05:50:48', '2024-10-11 05:53:46'),
(14, '670945bf88dea', 20, 11, 'Lunas', '29b85795-9ed2-45f5-81de-35edaae0b2c3', '2024-10-11 08:35:28', '2024-10-11 08:36:40'),
(15, '670946c2622a2', 21, 14, 'Lunas', 'db98e917-b010-4a3f-968d-ae5ca6500b14', '2024-10-11 08:39:46', '2024-10-11 08:40:50'),
(16, '670946c2622a2', 21, 12, 'Lunas', 'db98e917-b010-4a3f-968d-ae5ca6500b14', '2024-10-11 08:39:46', '2024-10-11 08:40:50'),
(17, '67094730bcd22', 22, 15, 'Pending', 'faf8b13f-dfc2-4d15-bf17-7afb273eb6d5', '2024-10-11 08:41:37', '2024-10-11 08:43:05'),
(18, '6709c8d52a11e', 23, 16, 'Lunas', 'e8b716a2-22b1-4e5d-ad1f-2faa6dc0ccbe', '2024-10-11 17:54:47', '2024-10-11 17:56:18'),
(19, '6709c9de9d58d', 24, 17, 'Transaksi Kadaluarsa', '794287a0-db78-4477-a7c1-e1e2e471caba', '2024-10-11 17:59:11', '2024-10-11 18:19:52'),
(20, '6709c9de9d58d', 24, 20, 'Transaksi Kadaluarsa', '794287a0-db78-4477-a7c1-e1e2e471caba', '2024-10-11 17:59:11', '2024-10-11 18:19:52'),
(21, '6709c9de9d58d', 24, 18, 'Transaksi Kadaluarsa', '794287a0-db78-4477-a7c1-e1e2e471caba', '2024-10-11 17:59:11', '2024-10-11 18:19:53'),
(22, '6709ca245ce4f', 26, 21, 'Lunas', '8af0e00c-6038-4405-8de7-aa574991c713', '2024-10-11 18:00:20', '2024-10-11 18:02:04'),
(23, '6709ca245ce4f', 26, 22, 'Lunas', '8af0e00c-6038-4405-8de7-aa574991c713', '2024-10-11 18:00:20', '2024-10-11 18:02:05'),
(24, '6709ca245ce4f', 26, 23, 'Lunas', '8af0e00c-6038-4405-8de7-aa574991c713', '2024-10-11 18:00:20', '2024-10-11 18:02:05'),
(25, '670a52b5733ff', 27, 25, 'Lunas', '625fad01-dae0-4e73-a5a7-d76478db26c4', '2024-10-12 03:43:04', '2024-10-12 03:44:47'),
(26, '670a541fc5261', 28, 29, 'Lunas', '3cb69c6c-dd19-40f7-b941-2f8660e98d72', '2024-10-12 03:49:05', '2024-10-12 03:49:55'),
(27, '670a541fc5261', 28, 27, 'Lunas', '3cb69c6c-dd19-40f7-b941-2f8660e98d72', '2024-10-12 03:49:05', '2024-10-12 03:49:55'),
(28, '670a5538ee1ae', 29, 30, 'Lunas', '92bc8262-ec70-49b3-9b4e-45c1f5c0bf5b', '2024-10-12 03:53:46', '2024-10-12 03:54:13'),
(29, '670a55867c9c1', 30, 31, 'Lunas', '643225b0-3817-4902-a0fd-a2f36f1e64c6', '2024-10-12 03:55:04', '2024-10-12 03:55:25'),
(30, '670a582199cd1', 31, 32, 'Pending', '1b744ef4-c302-4b95-a4be-10192cdffcea', '2024-10-12 04:06:11', '2024-10-12 04:06:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Customer') NOT NULL DEFAULT 'Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', '$2y$12$rKnYP9kiKzv.dmqB4P6BNuWicse.ZHBbZbGWoswY7QPraHwQK1kf.', 'Admin', '2024-10-10 19:39:48', '2024-10-10 19:39:48'),
(2, 'joker@gmail.com', '$2y$12$0q8U5ziqHNHB8R381SnsTuhVEI6vc9jOsu0eSHcpnFfJxW3cqCWQu', 'Customer', '2024-10-10 19:49:04', '2024-10-10 20:58:29'),
(3, 'adwadn@gmail.com', '$2y$12$LxkmJoFWEewzEcv2yJFCe.vym8ubVMsX.quYsEljfEZcUvJW3Llju', 'Customer', '2024-10-11 08:33:17', '2024-10-11 09:35:44'),
(4, 'krisnajokop@gmail.com', '$2y$12$H4kahqOjQjh4AAzkpvkk1.m2vSEEbyBWUOaeG1WGsgKMcvwsYISzy', 'Customer', '2024-10-11 17:48:27', '2024-10-11 17:48:27'),
(5, 'krisnajoko@gmail.com', '$2y$12$F0CF6u7BVzD5VRsk6JXkyedzGHpdvyXh0r5UgH9/Vsc60LRn6BTCO', 'Customer', '2024-10-12 03:40:30', '2024-10-12 03:40:30');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjangs_produk_id_foreign` (`produk_id`),
  ADD KEY `keranjangs_profil_id_foreign` (`profil_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produks_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `profils`
--
ALTER TABLE `profils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profils_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksis_profil_id_foreign` (`profil_id`);

--
-- Indeks untuk tabel `transaksi_finals`
--
ALTER TABLE `transaksi_finals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_finals_transaksi_id_foreign` (`transaksi_id`),
  ADD KEY `transaksi_finals_keranjang_id_foreign` (`keranjang_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `profils`
--
ALTER TABLE `profils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `transaksi_finals`
--
ALTER TABLE `transaksi_finals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD CONSTRAINT `keranjangs_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `keranjangs_profil_id_foreign` FOREIGN KEY (`profil_id`) REFERENCES `profils` (`id`);

--
-- Ketidakleluasaan untuk tabel `produks`
--
ALTER TABLE `produks`
  ADD CONSTRAINT `produks_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `profils`
--
ALTER TABLE `profils`
  ADD CONSTRAINT `profils_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD CONSTRAINT `transaksis_profil_id_foreign` FOREIGN KEY (`profil_id`) REFERENCES `profils` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi_finals`
--
ALTER TABLE `transaksi_finals`
  ADD CONSTRAINT `transaksi_finals_keranjang_id_foreign` FOREIGN KEY (`keranjang_id`) REFERENCES `keranjangs` (`id`),
  ADD CONSTRAINT `transaksi_finals_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksis` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
