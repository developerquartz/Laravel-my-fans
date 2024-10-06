<?php $__env->startSection('seo_title'); ?> <?php echo app('translator')->get('navigation.cards'); ?> - <?php $__env->stopSection(); ?>

<?php $__env->startSection( 'account_section' ); ?>


<?php echo csrf_field(); ?>
<div class="shadow-sm card add-padding">

<br/>
<h2 class="ml-2">
    <i class="fas fa-credit-card mr-1"></i> <?php echo app('translator')->get('navigation.cards'); ?></h2>
<hr>

<?php if(opt('card_gateway', 'Stripe') == 'Stripe'): ?>
    <a href="<?php echo e(route('addStripeCard')); ?>">+<?php echo app('translator')->get('general.addNewCard'); ?></a><br>
<?php elseif(opt('card_gateway', 'Stripe') == 'PayStack'): ?>
    <a href="<?php echo e(route('addPayStackCard')); ?>">+<?php echo app('translator')->get('general.addNewCard'); ?></a><br>
<?php endif; ?>

<?php
if (! isset($_instance)) {
    $dom = \Livewire\Livewire::mount('user-cards')->dom;
} elseif ($_instance->childHasBeenRendered('nd4LI0o')) {
    $componentId = $_instance->getRenderedChildComponentId('nd4LI0o');
    $componentTag = $_instance->getRenderedChildComponentTagName('nd4LI0o');
    $dom = \Livewire\Livewire::dummyMount($componentId, $componentTag);
    $_instance->preserveRenderedChild('nd4LI0o');
} else {
    $response = \Livewire\Livewire::mount('user-cards');
    $dom = $response->dom;
    $_instance->logRenderedChild('nd4LI0o', $response->id, \Livewire\Livewire::getRootElementTagName($dom));
}
echo $dom;
?>

<br/><br/>
</div><!-- /.white-smoke-bg -->
<?php $__env->stopSection(); ?>
<?php echo $__env->make( 'account' , \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/onlyfans/public_html/resources/views/billing/cards.blade.php ENDPATH**/ ?>