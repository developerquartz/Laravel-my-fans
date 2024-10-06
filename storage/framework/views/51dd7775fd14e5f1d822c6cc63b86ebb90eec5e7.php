<?php $__env->startComponent('mail::message'); ?>

Hi <em><strong><?php echo e($notifiable->name); ?></strong></em>,<br>

Congratulations, <br>

<strong><?php echo e($unlock->tipper->name); ?> - <a href="<?php echo e(route('profile.show', ['username' => $unlock->tipper->profile->username])); ?>"><?php echo e($unlock->tipper->profile->handle); ?></a></strong> just unlocked your message for <?php echo e(opt('payment-settings.currency_symbol') . $unlock->creator_amount); ?>


<br>

<br>

<a href="<?php echo e(route('notifications.index')); ?>">
    View Notifications
</a>

<br><br>

Regards,<br>
<?php echo e(env('APP_NAME')); ?>


<?php echo $__env->renderComponent(); ?><?php /**PATH /Users/crivion/Sites/patrons/resources/views/emails/unlockedMessageMail.blade.php ENDPATH**/ ?>