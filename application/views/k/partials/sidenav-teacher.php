<header>
	<div id="slide-out" class="side-nav sn-bg-4 fixed">
		<ul class="custom-scrollbar">
			<li>
				<div class="logo-wrapper waves-light d-flex flex-column align-items-center justify-content-center py-4">
					<a href="<?= base_url('docente') ?>" class="text-center w-100" style="text-decoration: none;">
						<div class="sidebar-shield mb-2">
							<?php $this->load->view('common/escudo_svg'); ?>
						</div>
						<h1 class="logo mt-2 mb-1">HIPERMEDIA</h1>
						<p class="subtitle text-uppercase mb-0">Univ. Nac. Exp. Rómulo Gallegos</p>
					</a>
				</div>
			</li>
			<li>
				<ul class="collapsible collapsible-accordion mt-3">
					<?php echo $seccion ?>
					<li>
						<?= anchor('docente', '<i class="fas fa-home"></i> Inicio', 'class="collapsible-header waves-effect active" id="inicio"') ?>
					</li>
					<li>
						<?= anchor('docente/contenidos', '<i class="fas fa-book"></i> Contenido', 'class="collapsible-header waves-effect" id="contenido"') ?>
					</li>
					<li>
						<?= anchor('docente/estudiantes', '<i class="fas fa-users"></i> Estudiantes', 'class="collapsible-header waves-effect" id="alumnos"') ?>
					</li>
					<li>
						<?= anchor('docente/evaluaciones', '<i class="fas fa-tasks"></i> Evaluaciones', 'class="collapsible-header waves-effect" id="examenes"') ?>
					</li>
					<li>
						<?= anchor('docente/asignaciones', '<i class="fas fa-calendar-check"></i> Asignaciones', 'class="collapsible-header waves-effect" id="asignaciones"') ?>
					</li>
					<li>
						<?= anchor('docente/herramientas', '<i class="fas fa-wrench"></i> Herramientas', 'class="collapsible-header waves-effect" id="herramientas"') ?>
					</li>
					<li>
						<?= anchor('docente/simuladores', '<i class="fas fa-code"></i> Simuladores', 'class="collapsible-header waves-effect" id="simulador"') ?>
					</li>
				</ul>
			</li>
			<li class="d-lg-none">
				<div class="dropdown-divider border-slate-700"></div>
			</li>
			<li class="d-lg-none">
				<?= anchor('backup', '<i class="fas fa-database"></i> Respaldo BD', 'class="collapsible-header waves-effect"') ?>
			</li>

			<li class="d-lg-none">
				<a class="nav-link dropdown-toggle collapsible-header" href="#" id="navbarDropdownMenuLinkMobile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-user-cog"></i> Prof. <?= $user[0]->nombre . ' ' . $user[0]->apellido ?>
				</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLinkMobile">
						<?php if ($cantMsg > 0): ?>
							<?= anchor('chat', "<i class='fas fa-comments mr-1'></i> Chat <span class='badge badge-danger ml-2'>$cantMsg</span>", ['class' => 'dropdown-item']) ?>
						<?php else: ?>
							<?= anchor('chat', "<i class='fas fa-comments mr-1'></i> Chat", ['class' => 'dropdown-item']) ?>
						<?php endif ?>

						<div class="dropdown-divider"></div>
						<?= anchor('docente/visitas', '<i class="fas fa-chart-bar mr-1"></i> Visitas', ['class' => 'dropdown-item']) ?>
						<?= anchor('perfil', '<i class="fas fa-user mr-1"></i> Perfil', ['class' => 'dropdown-item']) ?>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item text-danger" onclick="document.getElementById('formlogout').submit()" href="#logout">
							<i class="fas fa-power-off mr-1"></i> Salir
						</a>
					</div>
			</li>
		</ul>
		<div class="sidenav-bg mask-strong"></div>
	</div>
	<nav class="navbar fixed-top navbar-expand-lg double-nav white shadow-sm">
		<div class="float-left">
			<a href="#" data-activates="slide-out" class="button-collapse">
				<i class="fas fa-bars" style="color: #0f172a; font-size: 1.4rem; padding: 10px;"></i>
			</a>
		</div>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<ul class="nav navbar-nav mr-auto d-none d-lg-flex align-items-center">
				<li class="nav-item">
					<span class="nav-link font-weight-bold text-muted" style="font-size: 0.9rem;">
						<i class="fas fa-university mr-2 text-primary"></i>UNERG | Universidad Nacional Experimental Rómulo Gallegos
					</span>
				</li>
				<li class="nav-item">
					<span class="badge badge-primary ml-3 py-2 px-3" style="font-size: 0.85rem; border-radius: 8px;">
						<i class="fas fa-layer-group mr-1"></i> Sección <?= $seccion ?>
					</span>
				</li>
			</ul>

			<ul class="nav navbar-nav mr-auto d-lg-none">
				<li class="nav-item">
					<span class="nav-link font-weight-bold text-primary" style="font-size: 0.95rem;">
						HIPERMEDIA | Sec. <?= $seccion ?>
					</span>
				</li>
			</ul>

			<ul class="nav navbar-nav nav-flex-icons ml-auto">
				<li class="nav-item">
					<?= anchor('backup', '<i class="fas fa-database"></i> Respaldar BD', 'class="nav-link"') ?>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user-circle mr-2" style="font-size: 1.2rem; vertical-align: middle;"></i>
						<span style="vertical-align: middle;">Prof. <?= $user[0]->nombre . ' ' . $user[0]->apellido ?></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right shadow-sm border-0" aria-labelledby="navbarDropdownMenuLink" style="border-radius: 12px;">
						<?php if ($cantMsg > 0): ?>
							<?= anchor('chat', "<i class='fas fa-comments text-primary mr-2'></i> Chat <span class='badge badge-danger ml-auto'>$cantMsg</span>", ['class' => 'dropdown-item d-flex align-items-center']) ?>
						<?php else: ?>
							<?= anchor('chat', "<i class='fas fa-comments text-primary mr-2'></i> Chat", ['class' => 'dropdown-item d-flex align-items-center']) ?>
						<?php endif ?>
						<div class="dropdown-divider"></div>
						<?= anchor('docente/visitas', '<i class="fas fa-chart-bar text-info mr-2"></i> Visitas', ['class' => 'dropdown-item d-flex align-items-center']) ?>
						<?= anchor('perfil', '<i class="fas fa-user text-secondary mr-2"></i> Perfil', ['class' => 'dropdown-item d-flex align-items-center']) ?>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item text-danger d-flex align-items-center" onclick="document.getElementById('formlogout').submit()" href="#logout">
							<i class="fas fa-power-off mr-2"></i> Salir
						</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>
<?= form_open('logout', ['id' => 'formlogout']) ?></form>