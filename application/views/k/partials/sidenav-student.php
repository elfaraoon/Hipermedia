<header>
	<div id="slide-out" class="side-nav sn-bg-4 fixed">
		<ul class="custom-scrollbar">
			<li>
				<div class="logo-wrapper waves-light d-flex flex-column align-items-center py-4" style="border-bottom: 1px solid #1e293b !important; height: auto !important;">
					<a href="<?= base_url('estudiante') ?>" class="text-center w-100">
						<div class="sidebar-shield mb-1">
							<?php $this->load->view('common/escudo_svg'); ?>
						</div>
						<p class="logo mt-2 mb-0" style="font-size: 1.35rem; letter-spacing: 0.08em;">HIPERMEDIA</p>
						<p class="mb-0" style="font-size: 0.6rem; color: #64748b; letter-spacing: 0.04em; line-height: 1.3;">Univ. Nac. Exp. Rómulo Gallegos</p>
					</a>
				</div>
			</li>
			<li>
				<ul class="collapsible collapsible-accordion">
					<li>
						<?= anchor('estudiante', '<i class="fas fa-home"></i> Inicio', 'class="collapsible-header waves-effect active" id="inicio"') ?>
					</li>
					<li>
						<?= anchor('estudiante/contenidos', '<i class="fas fa-book"></i> Contenido', 'class="collapsible-header waves-effect" id="contenido"') ?>
					</li>
					<li>
						<?= anchor('estudiante/evaluaciones', '<i class="fas fa-tasks"></i> Evaluaciones', 'class="collapsible-header waves-effect" id="examenes"') ?>
					</li>
					<li>
						<?= anchor('estudiante/asignaciones', '<i class="fas fa-calendar-check"></i> Asignaciones', 'class="collapsible-header waves-effect" id="asignaciones"') ?>
					</li>
					<li>
						<?= anchor('estudiante/herramientas', '<i class="fas fa-cubes"></i> Herramientas', 'class="collapsible-header waves-effect" id="herramientas"') ?>
					</li>
					<li>
						<?= anchor('estudiante/simuladores', '<i class="fas fa-code"></i> Simuladores', 'class="collapsible-header waves-effect" id="simulador"') ?>
					</li>
				</ul>
			</li>
			<li class="d-lg-none">
				<div class="dropdown-divider"></div>
			</li>
			<li class="d-lg-none">
				<a class="nav-link dropdown-toggle collapsible-header" href="#" id="navbarDropdownMenuLinkMobile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-user"></i> Alumno: <?= $user[0]->nombre . ' ' . $user[0]->apellido ?>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLinkMobile">
					<?php if ($cantMsg > 0): ?>
						<?= anchor('chat', "<i class='fas fa-comments mr-1'></i> Chat <span class='badge badge-danger ml-2'>$cantMsg</span>", ['class' => 'dropdown-item']) ?>
					<?php else: ?>
						<?= anchor('chat', "<i class='fas fa-comments mr-1'></i> Chat", ['class' => 'dropdown-item']) ?>
					<?php endif ?>

					<div class="dropdown-divider"></div>
					<?= anchor('perfil', '<i class="fas fa-user mr-1"></i> Perfil', ['class' => 'dropdown-item']) ?>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" onclick="document.getElementById('formlogout').submit()" href="#logout">
						<i class="fas fa-power-off mr-1"></i> Salir
					</a>
				</div>
			</li>
			<li class="d-lg-none">
				<a class="collapsible-header waves-effect text-danger" onclick="document.getElementById('formlogout').submit()">
					<i class="fas fa-power-off"></i> Salir
				</a>
			</li>
		</ul>
		<div class="sidenav-bg mask-strong"></div>
	</div>
	<nav class="navbar fixed-top navbar-expand-lg double-nav white">
		<!-- Toggle button (only visible on mobile/tablet) -->
		<div class="float-left">
			<a href="#" data-activates="slide-out" class="button-collapse">
				<i class="fas fa-bars" style="color: #1e293b; font-size: 1.4rem; padding: 10px;"></i>
			</a>
		</div>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<!-- Brand text for laptop/desktop -->
			<ul class="nav navbar-nav mr-auto d-none d-lg-flex">
				<li class="nav-item">
					<span class="nav-link font-weight-bold text-muted" style="font-size: 0.9rem;">
						<i class="fas fa-university mr-2 text-primary"></i>UNERG | Universidad Nacional Experimental Rómulo Gallegos
					</span>
				</li>
				<li class="nav-item">
					<span class="nav-link font-weight-bold text-primary ml-3" style="font-size: 0.9rem;">
						<i class="fas fa-layer-group mr-1"></i>Sección <?= $seccion ?>
					</span>
				</li>
			</ul>

			<!-- Brand text for mobile/tablet -->
			<ul class="nav navbar-nav mr-auto d-lg-none">
				<li class="nav-item">
					<span class="nav-link font-weight-bold text-primary" style="font-size: 0.95rem;">
						HIPERMEDIA | Sec. <?= $seccion ?>
					</span>
				</li>
			</ul>

			<ul class="nav navbar-nav nav-flex-icons ml-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user mr-2"></i><?= $user[0]->nombre . ' ' . $user[0]->apellido ?>
					</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
						<?php if ($cantMsg > 0): ?>
							<?= anchor('chat', "<i class='fas fa-comments mr-1'></i> Chat <span class='badge badge-danger ml-2'>$cantMsg</span>", ['class' => 'dropdown-item']) ?>
						<?php else: ?>
							<?= anchor('chat', "<i class='fas fa-comments mr-1'></i> Chat", ['class' => 'dropdown-item']) ?>
						<?php endif ?>

						<div class="dropdown-divider"></div>
						<?= anchor('perfil', '<i class="fas fa-user mr-1"></i> Perfil', ['class' => 'dropdown-item']) ?>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" onclick="document.getElementById('formlogout').submit()" href="#logout">
							<i class="fas fa-power-off mr-1"></i> Salir
						</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>
<?= form_open('logout', ['id' => 'formlogout']) ?></form>