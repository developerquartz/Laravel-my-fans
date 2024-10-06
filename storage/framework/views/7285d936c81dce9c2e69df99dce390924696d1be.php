<?php $__env->startComponent('mail::message'); ?>

Hi <em><strong><?php echo e($notifiable->name); ?></strong></em>,<br>

Congratulations, <br>

<strong><?php echo e($tip->tipper->name); ?> - <a href="<?php echo e(route('profile.show', ['username' => $tip->tipper->profile->username])); ?>"><?php echo e($tip->tipper->profile->handle); ?></a></strong> just tipped you <?php echo e(opt('payment-settings.currency_symbol') . $tip->creator_amount); ?> for your post 
<a href="<?php echo e(route('single-post', ['post' => $tip->post_id])); ?>">
    <?php echo e(route('single-post', ['post' => $tip->post_id])); ?>

</a>

<br>

<br>

<a href="<?php echo e(route('myTips')); ?>">
    View My Tips
</a>

<br><br>

Regards,<br>
<?php echo e(env('APP_NAME')); ?>


<?php echo $__env->renderComponent(); ?><?php /**PATH /Users/crivion/Sites/patrons/resources/views/emails/tipReceivedMail.blade.php ENDPATH**/ ?>