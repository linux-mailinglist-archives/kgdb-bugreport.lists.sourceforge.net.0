Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1620089E9C2
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 07:30:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruQXr-0003CZ-P2
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 05:30:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ruQXr-0003CT-35
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 05:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BnPTa6MVlDVWzvetF9/+NE2WBoS2JkWTZiTjl3g4W8c=; b=nTGldkE409y96LOuLojALaMDtr
 Tf5AlloHXP4+1UfRdFoxj3c3DlmyosATeUXEnvSqW06BfKrhDwq6DujmoRqY+NHCmtxC0Avgwqt4X
 60dSI1AuYrh2nbxDRQCGU1ctgdI4q00BqpAHx5H4OC6xEkxXWQexF1c2Gd+AZOPvpP8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BnPTa6MVlDVWzvetF9/+NE2WBoS2JkWTZiTjl3g4W8c=; b=h55yAlz/mvOrw4cyyE41Np3qXy
 L/miEo7R6Ql0GVnr8al2s7f6FjGEHctgG8hKzfiMQE/oxoeEta5/zqAVwMokCebeRMfu14Efu1n9u
 wk/25R2XnWE08TdrSiaRvF+Fw710j7ydrHAYKu1/eFIDypo06B+kipnC+NiO56G7NhGA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruQXZ-0006Vv-TZ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 05:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6D253CE2316;
 Wed, 10 Apr 2024 05:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A17C433C7;
 Wed, 10 Apr 2024 05:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712727026;
 bh=wt+c2JdAu2t/Oj9T3uqp+BpP80JAAfO6pS/ZlaP+kXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yc3ueid+PbS6C9LNIsjvJX8owD7kPJQOHdZ1XOy8vINDYW0ATy8q7mLun+CqJERzW
 3hYhY5gc0hIwo1xkFV7BM9k6GXqLNBlQtTe1DEH91jleQvSKPkiiB4L7ANMec8/JCk
 g6B8SDAXl9MSvvIuWUaehdBE0jGYJ0zS1rKzXmf4=
Date: Wed, 10 Apr 2024 07:30:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: liu.yec@h3c.com
Message-ID: <2024041014-padlock-aggregate-4705@gregkh>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410020615.2885000-1-liu.yec@h3c.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 10, 2024 at 10:06:15AM +0800, liu.yec@h3c.com
 wrote: > From: LiuYe <liu.yeC@h3c.com> > > Currently, if CONFIG_KDB_KEYBOARD
 is enabled, then kgdboc will > attempt to use schedule_work() to [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruQXZ-0006Vv-TZ
Subject: Re: [Kgdb-bugreport] [PATCH V10] kdb: Fix the deadlock issue in KDB
 debugging.
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 10, 2024 at 10:06:15AM +0800, liu.yec@h3c.com wrote:
> From: LiuYe <liu.yeC@h3c.com>
> 
> Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will
> attempt to use schedule_work() to provoke a keyboard reset when
> transitioning out of the debugger and back to normal operation.
> This can cause deadlock because schedule_work() is not NMI-safe.
> 
> The stack trace below shows an example of the problem. In this
> case the master cpu is not running from NMI but it has parked
> the slave CPUs using an NMI and the parked CPUs is holding
> spinlocks needed by schedule_work().
> 
> Example:
> BUG: spinlock lockup suspected on CPU#0. owner_cpu: 1
> CPU1: Call Trace:
> __schedule
> schedule
> schedule_hrtimeout_range_clock
> mutex_unlock
> ep_scan_ready_list
> schedule_hrtimeout_range
> ep_poll
> wake_up_q
> SyS_epoll_wait
> entry_SYSCALL_64_fastpath
> 
> CPU0: Call Trace:
> dump_stack
> spin_dump
> do_raw_spin_lock
> _raw_spin_lock
> try_to_wake_up
> wake_up_process
> insert_work
> __queue_work
> queue_work_on
> kgdboc_post_exp_handler
> kgdb_cpu_enter
> kgdb_handle_exception
> __kgdb_notify
> kgdb_notify
> notifier_call_chain
> notify_die
> do_int3
> int3
> 
> We fix the problem by using irq_work to call schedule_work()
> instead of calling it directly. This is because we cannot
> resynchronize the keyboard state from the hardirq context
> provided by irq_work. This must be done from the task context
> in order to call the input subsystem.
> 
> Therefore, we have to defer the work twice. First, safely
> switch from the debug trap context (similar to NMI) to the
> hardirq, and then switch from the hardirq to the system work queue.
> 
> Signed-off-by: LiuYe <liu.yeC@h3c.com>
> Co-developed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Greg KH <gregkh@linuxfoundation.org>

I have NOT signed off on this commit.  You just said that I made a legal
statement about this commit without that actually being true???

Sorry, but that is flat out not acceptable at all.  Please go work with
your company lawyers to figure out what you did and come back with an
explaination of exactly what this is and how it will not happen again.

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
