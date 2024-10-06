<?php $__env->startSection('seo_title'); ?> <?php echo app('translator')->get('navigation.signUp'); ?> - <?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>


<div class="login_screen">
	<div class="container">
		<div class="row">
			<div class="col-half">
				<div class="login-img">
					 <img src="<?php echo e(asset('public/images')); ?>/login-img.jpg" alt="">
				</div>     
			</div>
			<div class="col-half">
				<div class="logo">
					<a href="#">
						<img src="<?php echo e(asset('public/images')); ?>/logo.svg" alt="">
					</a>
				</div>

				<span class="title_line">Sign up to make money and interact with your fans!</span>

                    <form method="POST" action="<?php echo e(route('register')); ?>">
                        <?php echo csrf_field(); ?>

                        <div class="form-group ">
                            <!--<label for="name" class="col-md-4 col-form-label text-md-right"><?php echo app('translator')->get('auth.name'); ?></label>-->

                            <div class="form-group">
                                <input id="name" type="text" class="form-control<?php echo e($errors->has('name') ? ' is-invalid' : ''); ?>" name="name" value="<?php echo e(old('name')); ?>" placeholder="Name" required autofocus>

                                <?php if($errors->has('name')): ?>
                                    <span class="invalid-feedback" role="alert">
                                        <strong><?php echo e($errors->first('name')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group ">
                            <!--<label for="email" class="col-md-4 col-form-label text-md-right"><?php echo app('translator')->get('auth.email'); ?></label>-->

                            <div class="form-group">
                                <input id="email" type="email" class="form-control<?php echo e($errors->has('email') ? ' is-invalid' : ''); ?>" name="email" value="<?php echo e(old('email')); ?>" placeholder="Email" required>

                                <?php if($errors->has('email')): ?>
                                    <span class="invalid-feedback" role="alert">
                                        <strong><?php echo e($errors->first('email')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group ">
                            <!--<label for="password" class="col-md-4 col-form-label text-md-right"><?php echo app('translator')->get('auth.password'); ?></label>-->

                            <div class="form-group">
                                <input id="password" type="password" class="form-control<?php echo e($errors->has('password') ? ' is-invalid' : ''); ?>" name="password" placeholder="Password" required>

                                <?php if($errors->has('password')): ?>
                                    <span class="invalid-feedback" role="alert">
                                        <strong><?php echo e($errors->first('password')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group ">
                            <!--<label for="password-confirm" class="col-md-4 col-form-label text-md-right"><?php echo app('translator')->get('auth.confirmPassword'); ?></label>-->

                            <div class="form-group">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirm Password" required>
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="submit_btn">
                                    <?php echo app('translator')->get( 'navigation.signUp' ); ?>
                                </button>
                            </div>
                        </div>
                    </form>
                <!--<div class="form-text">
					<p>Visit <a href="#">Help Center</a> for additional help if you are unable to log in with your existing OnlyFans Account</p>
				</div>-->

				<div class="create__Account">
					<p>Do you have an account?</p>
					<a href="/login">Login for MyFans.com</a>
				</div>
			</div>
		</div>
	</div>
</div>

<style type="text/css">
	.container {
		max-width: 1600px;
		margin: 0 auto;
		padding-left: 60px;
		padding-right: 60px;
	}
	.login_screen .row {
		display: flex;
		flex-wrap: wrap;
	}
	.login_screen  .col-half {
		width: 50%;
		padding-top: 30px;
	}
	.login-img {
		text-align: center;
	}
	.logo img {
		width: 180px;
	}
	.title_line {
		font-family: 'Roboto', sans-serif;
		text-align: center;
		width: 100%;
		display: block;
		color: #898989;
	}
	.logo {
		text-align: center;
		margin: 20px 0;
	}
	.login_btn {
		display: flex;
		width: 100%;
		max-width: 350px;
		height: 48px;
		background: #1da1f2;
		border: none;
		border-radius: 200px;
		margin-bottom: 10px;
		justify-content: center;
		align-items: center;
		font-family: 'Roboto', sans-serif;
		color: #fff;
		text-transform: uppercase;
		font-size: 14px;
		font-weight: 500;
		cursor: pointer;
	}
	.login_btn svg {
		width: 24px;
		height: 24px;
		margin-right: 10px;
	}
	.login_screen form {
		max-width: 350px;
		margin: 0 auto;
		margin-top: 30px;
	}
	.google_btn {
		background: #4285f4;
	}
	.login_btn:hover {
		background: #148fda;
	}
	.google_btn:hover {
		background: #2f6cd2;
	}
	.trough:before {
		right: 50%;
		margin-right: 23px;
	}
	.trough:after, .trough:before {
		position: absolute;
		content: "";
		height: 1px;
		width: 50%;
		top: 50%;
		background: rgba(138,150,163,.2);
	}
	.trough:after {
		left: 50%;
		margin-left: 23px;
	}
	.trough span {
		padding: 0 13px;
		background:#fff;
		position: relative;
		z-index: 2;
	}
	.trough {
		position: relative;
		display: block;
		overflow: hidden;
		clear: both;
		color: #8a96a3;
		text-transform: uppercase;
		margin: 40px 0;
		text-align: center;
		font-family: 'Roboto', sans-serif;
	}
	.login_screen form .form-control {
		width: 100%;
		height: 48px;
		background: #fff;
		border-radius: 6px;
		border: 1px solid #ddd;
		padding: 0 12px;
		outline: none;
	}
	.login_screen form .form-group {
		margin-bottom: 20px;
	}
	.forgot-password {
		color: #02b4cc;
		font-family: 'Roboto', sans-serif;
		text-decoration: none;
		font-size: 14px;
		margin-top: 7px;
		display: block;
	}
	.login_screen .submit_btn {
		display: flex;
		width: 100%;
		max-width: 350px;
		height: 48px;
		background: #02b4cc;
		border: none;
		border-radius: 200px;
		margin-bottom: 10px;
		justify-content: center;
		align-items: center;
		font-family: 'Roboto', sans-serif;
		color: #fff;
		text-transform: uppercase;
		font-size: 14px;
		font-weight: 500;
		cursor: pointer;
	}
	.login_screen .submit_btn:hover {
		background: #1388d0;
	}
	.form-text {
		max-width: 240px;
		text-align: center;
		margin: 0 auto;
		margin-top: 40px;
		margin-bottom: 20px;
		border-bottom: 1px solid #ddd;
	}
	.form-text p {
		font-family: 'Roboto', sans-serif;
		font-size: 14px;
		color: #858383;
	}
	.form-text p a{
		color: #02b4cc;
		text-decoration: none;
	}
	.create__Account {
		text-align: center;
	}
	.create__Account a, .create__Account p {
		font-family: 'Roboto', sans-serif;
		margin: 4px 0;
		font-size: 15px;
		text-decoration: none;
	}
	.create__Account a {
		color: #02b4cc;
	}
</style>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('welcome_copy', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/onlyfans/public_html/resources/views/auth/register.blade.php ENDPATH**/ ?>