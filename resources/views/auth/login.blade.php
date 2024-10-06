@extends('welcome_copy')

@section('seo_title') @lang('navigation.login') - @endsection

@section('content')
<div class="login_screen">
	<div class="container">
		<div class="row">
			<div class="col-half">
				<div class="login-img">
					 <img src="{{ asset('public/images') }}/login-img.jpg" alt="">
				</div>     
			</div>
			<div class="col-half">
				<div class="logo">
					<a href="#">
						<img src="{{ asset('public/images') }}/logo.svg" alt="">
					</a>
				</div>

				<span class="title_line">Sign up to make money and interact with your fans!</span>

				<form method="POST" action="{{ route('login') }}">
					@csrf
					<!--<button type="button" class="login_btn twitter_btn">
						<svg aria-hidden="true" focusable="false" data-prefix="fab" data-icon="twitter" class="svg-inline--fa fa-twitter fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path></svg>
						<span>Sign in with twitter</span>
					</button>
					<button type="button" class="login_btn google_btn">
						<svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="google" class="svg-inline--fa fa-google fa-w-16" role="img" viewBox="0 0 488 512"><path fill="currentColor" d="M488 261.8C488 403.3 391.1 504 248 504 110.8 504 0 393.2 0 256S110.8 8 248 8c66.8 0 123 24.5 166.3 64.9l-67.5 64.9C258.5 52.6 94.3 116.6 94.3 256c0 86.5 69.1 156.6 153.7 156.6 98.2 0 135-70.4 140.8-106.9H248v-85.3h236.1c2.3 12.7 3.9 24.9 3.9 41.4z"/></svg>
						<span>Sign in with google</span>
					</button>
					<span class="trough"><span>or</span></span>-->

					<div class="form-group">
						<!--<input type="email" name="" placeholder="Email" class="form-control">-->
						<input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}"  placeholder="Email" required autofocus>
						@if ($errors->has('email'))
							<span class="invalid-feedback" role="alert">
								<strong>{{ $errors->first('email') }}</strong>
							</span>
						@endif
					</div>
					<div class="form-group">
						<!--<input type="password" name="" placeholder="Password" class="form-control">
						<a href="#" class="forgot-password">Forgot Password</a>-->
						<input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password"  placeholder="Password" required>
						@if ($errors->has('password'))
							<span class="invalid-feedback" role="alert">
								<strong>{{ $errors->first('password') }}</strong>
							</span>
						@endif
						
						@if (Route::has('password.request'))
							<a class="forgot-password" href="{{ route('password.request') }}">
								@lang( 'auth.forgotPassword' )
							</a>
						@endif
						
					</div>

					<div class="form-group">
						<!--<input type="submit" name="" value="Login" class="submit_btn">-->
						<button type="submit" class="submit_btn">
								@lang( 'auth.login' )
						</button>
					</div>
				
				</form>

				<!--<div class="form-text">
					<p>Visit <a href="#">Help Center</a> for additional help if you are unable to log in with your existing OnlyFans Account</p>
				</div>-->

				<div class="create__Account">
					<p>Don't have an account yet?</p>
					<a href="/register">Sign up for MyFans.com</a>
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
@endsection
