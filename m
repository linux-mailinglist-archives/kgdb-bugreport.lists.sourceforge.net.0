Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22B7CC29
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 20:41:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hstXp-0008FR-JD
	for lists+kgdb-bugreport@lfdr.de; Wed, 31 Jul 2019 18:41:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hstXp-0008FJ-7z
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 18:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3AsLIdRn1/s/ajhZAFGpfmDm8iyB8h5HN7OzbntAvwU=; b=X8VEY3mshl6aqa/Nt6Mk1LvtGZ
 CQKgELFIUoYAAw17XZCdaClHHYx9dYLS9mq68p9miT6lxMzBsNc2dVooMVR88EVEEmZlmM1IPdBmM
 Nd3fq4xHlp0gbVEGLsmDISxFdtUjjt9PyCXBOglOnNrww9UcNllJa5I+pR6yviCkU4cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3AsLIdRn1/s/ajhZAFGpfmDm8iyB8h5HN7OzbntAvwU=; b=EDHgiJdlnfvXRuZJu1kgfyiwh/
 nSu7IqkHEc2i63iVO29lWdWXNQHCalFut0I//J0K/CQfGr3l/yvNdyNlNeAm2Ia0jLJ8LEhCOVjFX
 2Ty5xECvzD8Y1tELvrMSH8AuOShkpgWaWuHGkF8OJRoSLCqxBnsYlyKp2fTaxlqtMYJY=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hstXk-005Xc0-PD
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 18:41:49 +0000
Received: by mail-io1-f65.google.com with SMTP id z3so19653907iog.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 31 Jul 2019 11:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3AsLIdRn1/s/ajhZAFGpfmDm8iyB8h5HN7OzbntAvwU=;
 b=PxOfkjT7L+Hwdws3JZ6LI7RIiZnSFD26K9lcMVVxc7bdsCSr6UJeCFlxR2ViMJRVgZ
 kKcCXB97d79J4mBEjnLyj18g9tQyLOnRgxTkJ1nN/qkHZ8DkRWoinzBu16Zow0FHmIpz
 HVoScJTEr7/TuqQu0dTMDxJariUa7FqrVwyGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3AsLIdRn1/s/ajhZAFGpfmDm8iyB8h5HN7OzbntAvwU=;
 b=dsXj9RCrkaBtVYySZFRkJeL4k/vXGqbg2SXhnIBiDU/r5gvQWyBq4/dES3YgkAn63+
 XTfkOxKvaMoRHxM+K1zVo55C7gpNML5yYpOPcKjD5Ud1lEw0V0LviN72oI6dxe9n1UN0
 tuQFUR3WWYg1mstdRUit6VoKkqtlO/Be41P20jeLUfLDxTyqO7lmoqoS62wG/pcQTr8H
 2Dft7R98ohTlQZEs4UGthCbC8ladQXZVr47ynNh43MsfCJbvPNJRqhU/UOuaqLT/y5h6
 N0K9uW5uluuua82gOHNzUgjIZohE2eNkjAYPvjm18ruQAGI13LQoIcUVN+oU1Jd+KIqy
 Z4+w==
X-Gm-Message-State: APjAAAUCuVEPd1z2ijBn4EaGqN+rg0jMDufF4qTAspXqb5xS4rFm9fuZ
 Z90h12WKueLFI7XqQ3RkiZSigDi/eY0=
X-Google-Smtp-Source: APXvYqwWn+dm94Vv+QpTVuc7BTJC8wC1gHAAhpTJ5zSrZBGnWjjuuM6inYuZvgK8Sa6dVvGt+9BGJQ==
X-Received: by 2002:a02:c65a:: with SMTP id k26mr54671169jan.18.1564598498154; 
 Wed, 31 Jul 2019 11:41:38 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id l14sm65953653iob.1.2019.07.31.11.41.37
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 11:41:37 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id j6so18721330ioa.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 31 Jul 2019 11:41:37 -0700 (PDT)
X-Received: by 2002:a02:a1c7:: with SMTP id o7mr131531038jah.26.1564598496739; 
 Wed, 31 Jul 2019 11:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190730221800.28326-1-dianders@chromium.org>
 <20190731125733.op3y5j5psuj6pet3@willie-the-truck>
In-Reply-To: <20190731125733.op3y5j5psuj6pet3@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Jul 2019 11:41:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYC4x7MCfkHbB=Mm-6NJywbXs4zAGfz0t+5OdXFOmE7g@mail.gmail.com>
Message-ID: <CAD=FV=WYC4x7MCfkHbB=Mm-6NJywbXs4zAGfz0t+5OdXFOmE7g@mail.gmail.com>
To: Will Deacon <will@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hstXk-005Xc0-PD
Subject: Re: [Kgdb-bugreport] [PATCH] arm64: debug: Make 'btc' and similar
 work in kdb
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Jul 31, 2019 at 5:57 AM Will Deacon <will@kernel.org> wrote:
>
> Hi Doug,
>
> On Tue, Jul 30, 2019 at 03:18:00PM -0700, Douglas Anderson wrote:
> > diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> > index 43119922341f..b666210fbc75 100644
> > --- a/arch/arm64/kernel/kgdb.c
> > +++ b/arch/arm64/kernel/kgdb.c
> > @@ -148,6 +148,45 @@ sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *task)
> >       gdb_regs[32] = cpu_context->pc;
> >  }
> >
> > +void kgdb_call_nmi_hook(void *ignored)
> > +{
> > +     struct pt_regs *regs;
> > +
> > +     /*
> > +      * NOTE: get_irq_regs() is supposed to get the registers from
> > +      * before the IPI interrupt happened and so is supposed to
> > +      * show where the processor was.  In some situations it's
> > +      * possible we might be called without an IPI, so it might be
> > +      * safer to figure out how to make kgdb_breakpoint() work
> > +      * properly here.
> > +      */
> > +     regs = get_irq_regs();
> > +
> > +     /*
> > +      * Some commands (like 'btc') assume that they can find info about
> > +      * a task in the 'cpu_context'.  Unfortunately that's only valid
> > +      * for sleeping tasks.  ...but let's make it work anyway by just
> > +      * writing the registers to the right place.  This is safe because
> > +      * nobody else is using the 'cpu_context' for a running task.
> > +      */
> > +     current->thread.cpu_context.x19 = regs->regs[19];
> > +     current->thread.cpu_context.x20 = regs->regs[20];
> > +     current->thread.cpu_context.x21 = regs->regs[21];
> > +     current->thread.cpu_context.x22 = regs->regs[22];
> > +     current->thread.cpu_context.x23 = regs->regs[23];
> > +     current->thread.cpu_context.x24 = regs->regs[24];
> > +     current->thread.cpu_context.x25 = regs->regs[25];
> > +     current->thread.cpu_context.x26 = regs->regs[26];
> > +     current->thread.cpu_context.x27 = regs->regs[27];
> > +     current->thread.cpu_context.x28 = regs->regs[28];
> > +     current->thread.cpu_context.fp = regs->regs[29];
> > +
> > +     current->thread.cpu_context.sp = regs->sp;
> > +     current->thread.cpu_context.pc = regs->pc;
> > +
> > +     kgdb_nmicallback(raw_smp_processor_id(), regs);
> > +}
>
> This is really gross... :/

Well, sort of.  At first I definitely thought of it as a hack.  ...but
then I realized that it's actually not so terrible.  Although the
other processors (the ones that are not the kgdb master) are
technically "running" as far as Linux is concerned, you can also think
of them as "stopped" in the debugger.  It's convenient to think of
them the same way you'd think of sleeping tasks.

Said another way: normally for a "running" task you couldn't put
anything in the "cpu_context" because it'd be wrong the moment you put
it there.  ...but when a CPU is stopped in kgdb then there's actually
something quite sane to put there.

So with just a small shift in the concept of what "cpu_context" is for
then it becomes not so gross.


> Can you IPI the other CPUs instead and have them backtrace locally, like we
> do for things like magic sysrq (sysrq_handle_showallcpus())?

No, unfortunately.  All the other CPUs are in a tight loop (with
interrupts off) waiting to be released by the kgdb master.  Amusingly,
it's possible to simulate this.  You can run a sysrq from the kdb
prompt.  When I do "sr l" from kdb:

A) The CPU running the kgdb master provides a stack crawl but it's not
really what you want.  Presumably this doesn't matter (we wouldn't
want to send the IPI to the calling CPU), but it's interesting to look
at.  We end up in the fallback workqueue case in
sysrq_handle_showallcpus().  Then we will backtrace based on the regs
returned by "get_irq_regs()".  Thus instead of:

[0]kdb> bt
Stack traceback for pid 0
0xffffff801101a9c0        0        0  1    0   R  0xffffff801101b3b0 *swapper/0
Call trace:
 dump_backtrace+0x0/0x138
 show_stack+0x20/0x2c
 kdb_show_stack+0x60/0x84
 kdb_bt1+0xb8/0x100
 kdb_bt+0x24c/0x408
 kdb_parse+0x53c/0x664
 kdb_main_loop+0x7fc/0x888
 kdb_stub+0x2b0/0x3d0
 kgdb_cpu_enter+0x27c/0x5c4
 kgdb_handle_exception+0x198/0x1f4
 kgdb_compiled_brk_fn+0x34/0x44
 brk_handler+0x88/0xd0
 do_debug_exception+0xe0/0x128
 el1_dbg+0x18/0x8c
 kgdb_breakpoint+0x20/0x3c
 sysrq_handle_dbg+0x34/0x5c
 __handle_sysrq+0x14c/0x170
 handle_sysrq+0x38/0x44
 serial8250_handle_irq+0xe8/0xfc
 dw8250_handle_irq+0x94/0xd0
 serial8250_interrupt+0x48/0xa4
 __handle_irq_event_percpu+0x134/0x25c
 handle_irq_event_percpu+0x34/0x8c
 handle_irq_event+0x48/0x78
 handle_fasteoi_irq+0xd0/0x1a0
 __handle_domain_irq+0x84/0xc4
 gic_handle_irq+0x10c/0x180
 el1_irq+0xb8/0x180
 cpuidle_enter_state+0x284/0x428
 cpuidle_enter+0x38/0x4c
 do_idle+0x168/0x29c
 cpu_startup_entry+0x24/0x28
 rest_init+0xd4/0xe0
 arch_call_rest_init+0x10/0x18
 start_kernel+0x320/0x3a4

I get:

[0]kdb> sr l
sysrq: Show backtrace of all active CPUs
sysrq: CPU0:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.3.0-rc2+ #28
Hardware name: Google Kevin (DT)
pstate: 20000005 (nzCv daif -PAN -UAO)
pc : cpuidle_enter_state+0x284/0x428
lr : cpuidle_enter_state+0x274/0x428
sp : ffffff8011003e60
x29: ffffff8011003eb0 x28: ffffff8010f366b8
x27: ffffff8011010000 x26: 0000000000000001
x25: ffffff80110eb000 x24: 0000000000000000
x23: 00000024232e8f0a x22: 0000002420501a35
x21: 0000000000000002 x20: ffffffc0ee86e080
x19: ffffffc0f65426c0 x18: 0000000000000000
x17: 000000000000003e x16: 000000000000003f
x15: 0000000000000000 x14: ffffff801101a9c0
x13: 0000000000013320 x12: 0000000000000020
x11: 000000000624dd2f x10: 00000000ffffffff
x9 : 0000000100000001 x8 : 00000000000000c0
x7 : 00000032b5593519 x6 : 0000000000300000
x5 : 0000000000000000 x4 : 0000000000000101
x3 : 00000000ffffffff x2 : 0000000000000001
x1 : ffffffc0f6548d80 x0 : 0000000000000000
Call trace:
 cpuidle_enter_state+0x284/0x428
 cpuidle_enter+0x38/0x4c
 do_idle+0x168/0x29c
 cpu_startup_entry+0x24/0x28
 rest_init+0xd4/0xe0
 arch_call_rest_init+0x10/0x18
 start_kernel+0x320/0x3a4


B) All the other CPUs don't respond.  ...until you exit the debugger
and then they all print their stacks, a little too late.

---

The weird crawl for the master CPU made me think that maybe I could
use "show_regs()" to show the stacks of the other CPUs, but that
didn't work.  The arm64 stack crawling code really only works for a
sleeping task or for the current running task.

...this again gets back to the fact that we can really think of those
other CPUs stopped in the debugger as "sleeping".

=====

OK, so I think I managed to get something that maybe you're happy with:

https://lkml.kernel.org/r/20190731183732.178134-1-dianders@chromium.org

...I still think it's not such a hack to stash the state in the
"cpu_context" and I could imagine it might have other benefits when
debugging, but my new patch does have the advantage that it's more
platform agnostic.  ;-)  Let me know what you think...

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
