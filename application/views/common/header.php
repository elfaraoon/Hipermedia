<!DOCTYPE html>
<html lang="es">

<?php
header("Referrer-Policy: no-referrer-when-downgrade");
?>
<script>
	var base_url = '<?php echo base_url(); ?>';
</script>
<meta name="referrer" content="no-referrer">

<head>
	<meta charset="UTF-8">
	<title><?= $title ?> | <?= $page ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Plataforma educativa de Hipermedia - Universidad Nacional Experimental Rómulo Gallegos">
	<meta name="theme-color" content="#0f172a">
	<link rel="stylesheet" href="<?php echo base_url('application/assets/css/mdb-4.8.8.min.css'); ?>">
	<link rel="stylesheet" href="<?php echo base_url('application/assets/css/fontawesome/css/all.min.css'); ?>">
	<link rel="stylesheet" href="<?php echo base_url('application/assets/css/app.css'); ?>">
</head>

<body class="fixed-sn fondo-claro white-skin" style="min-height: 100%; overflow-x: hidden;">