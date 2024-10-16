<?php $__env->startSection('section_title'); ?>
	<strong>Payments Settings</strong>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('section_body'); ?>

<?php
if (! isset($_instance)) {
    $dom = \Livewire\Livewire::mount('admin-payment-settings')->dom;
} elseif ($_instance->childHasBeenRendered('mN0u0MV')) {
    $componentId = $_instance->getRenderedChildComponentId('mN0u0MV');
    $componentTag = $_instance->getRenderedChildComponentTagName('mN0u0MV');
    $dom = \Livewire\Livewire::dummyMount($componentId, $componentTag);
    $_instance->preserveRenderedChild('mN0u0MV');
} else {
    $response = \Livewire\Livewire::mount('admin-payment-settings');
    $dom = $response->dom;
    $_instance->logRenderedChild('mN0u0MV', $response->id, \Livewire\Livewire::getRootElementTagName($dom));
}
echo $dom;
?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.base', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/onlyfans/public_html/resources/views/admin/payments-setup.blade.php ENDPATH**/ ?>