<?php $__env->startSection('seo_title'); ?> <?php echo app('translator')->get('navigation.billing'); ?> - <?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="container mt-5">
    <div class="row">

        <div class="col-12 col-sm-12 col-md-6 offset-0 offset-sm-0 offset-md-3">
            <div class="card shadow-sm p-3 mb-3">
                
                <div class="alert alert-secondary text-center">
                    <h5>
                        <?php echo app('translator')->get('v17.paystackAuthorization'); ?>
                    </h5>
                </div>
                
                <div class="text-center">
                <div class="alert alert-secondary">
                    <?php echo app('translator')->get('v17.minAmountDescription', ['minChargeAmount' => opt('payment-settings.currency_symbol') . $minChargeAmount]); ?>
                </div>
                <form method="POST" action="<?php echo e(route('paystack-authorization')); ?>">
                    <?php echo csrf_field(); ?>
                    <input type="submit" class="btn btn-primary" value="<?php echo app('translator')->get('v17.goToPayStack'); ?>" id="checkout-button">
                </form>
                </div>

				<hr>
				<div class="row">
				<div class="col-12 text-center">
				<img src="<?php echo e(asset('images/powered-by-paystack.png')); ?>" alt='paystack' />
				</div>
				</div>

                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('welcome', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /Users/crivion/Sites/patrons/resources/views/billing/paystack-add-card.blade.php ENDPATH**/ ?>