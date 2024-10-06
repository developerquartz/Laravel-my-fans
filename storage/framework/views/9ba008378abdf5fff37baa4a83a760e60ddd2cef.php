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
                
                <form method="POST" action="<?php echo e(route('mercadopago-authorization-callback')); ?>">
                    <script
                      src="https://www.mercadopago.com.mx/integrations/v1/web-tokenize-checkout.js"
                      data-public-key="<?php echo e(opt('MERCADOPAGO_PUBLIC_KEY')); ?>"
                      data-transaction-amount="<?php echo e($minChargeAmount); ?>"
                      data-transaction-currency="<?php echo e(opt('payment-settings.currency_code')); ?>">
                    </script>
                </form>


                </div>

				<hr>
				<div class="row">
				<div class="col-12 text-center">
				    <img src="<?php echo e(asset('images/powered-by-mercadopago.png')); ?>" alt='mercadopago' />
				</div>
				</div>

                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('extraJS'); ?>
<script src="https://secure.mlstatic.com/sdk/javascript/v1/mercadopago.js"></script>

<?php $__env->stopPush(); ?>
<?php echo $__env->make('welcome', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /Users/crivion/Sites/patrons/resources/views/billing/mercadopago-add-card.blade.php ENDPATH**/ ?>