Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB2A243199
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Aug 2020 02:00:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k60fJ-00079k-14
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Aug 2020 00:00:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k60fH-00079Z-Px
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 00:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZ0DPU+7FEgTW1kdKvFkaE475aoyAvXltQCD2JpTtaU=; b=Fuet/3Khy0LK4t+AQTH3HvMGGH
 jiVVXSITwyiXvzloWOtyhvWlaxICDQasuab2JdLVaO12l1fKW+VWnWb7XDGsyLjVQKvOajivh96o5
 oOIeLvl29F3pLuF8p/IifPabonfWd4PecAI35VUe0io0+AP7PwYsRvuKHYSbh0KMQrCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YZ0DPU+7FEgTW1kdKvFkaE475aoyAvXltQCD2JpTtaU=; b=fGueglEsizF7SKfqyf9x1JLDpC
 iIDRxRx84yH3XgpEnO3hoMVnT+NWOAjfk0IfLsTkKfbYiiBiZ20J5wbwHsT/Z8AuVHnBxrF2rg7OV
 HZuvdVbwKTRqEvTraNY/SwswXJ9oce4uYhepVNXa7HEamrjOCjRynPMGFQctJJZN+960=;
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k60fG-008WDg-BX
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 00:00:15 +0000
Received: by mail-ua1-f65.google.com with SMTP id x17so1130252uao.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 17:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZ0DPU+7FEgTW1kdKvFkaE475aoyAvXltQCD2JpTtaU=;
 b=cADRa2L+LNtmOC8nGDW4NEBh1LKPUNQBVbSJ2lRlPO7/ex575XERs6bkt8ye0WQ36q
 nKfPHAfk093ngCTZeIOX3r4GXkJbFYEonLHqKYPfvuBmjEDniJ+DDci92BugIbisNdPp
 AwJF9BUpjxQHhED+vrE0T9EHVEbtGvjX8N8kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZ0DPU+7FEgTW1kdKvFkaE475aoyAvXltQCD2JpTtaU=;
 b=m6OXOjXZy0/jPcmz6REef43rgpz7/0GAH8TUyxzWFhOcsx3jAYs19Mo5flKoT0vMjw
 kgFlPuU6pgK97DPFIEv8D+uUGP8M/OSxbvI3uxHcB2x3l0u9I/8oFuPrSh69X5vOHpeX
 XjBYu/keR4Ys/1tfwnqjihZQbGRC++De1umrePtcinbVX1F8C4SzxMhzPmn3gWVNsnkj
 JCX5foZb7yTQHsasaWfCCYUPFj9GNOzZC0cyZ08/0uFVbHV05GAmOTBaxksbDPTGmk8a
 ctDfRPO2Ve4uwzMteE4eDBWce3eIszV1bdGUUD+MmAcKueBbNlGvr7rP5lYvhvwv5hAH
 b7Hw==
X-Gm-Message-State: AOAM533RUd0Cqi9ANYX8pjinIKRBDLXa39Atqq6jXx2eRMY0tzzDY5TV
 1ZVSSrboQvrlxiI88qefU6QSRdiGaSM=
X-Google-Smtp-Source: ABdhPJyDf6NYO2R535Ozbq0yIcGXSfi8KMEmBY+/MfK8E8g+D7hW2d6pUB41F4Vu5vjn89gtv7BcNg==
X-Received: by 2002:ab0:6905:: with SMTP id b5mr1601113uas.110.1597276801102; 
 Wed, 12 Aug 2020 17:00:01 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id d204sm542947vkf.37.2020.08.12.17.00.00
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 17:00:00 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id x142so905247vke.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 17:00:00 -0700 (PDT)
X-Received: by 2002:a1f:fc02:: with SMTP id a2mr1543414vki.65.1597276799887;
 Wed, 12 Aug 2020 16:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-2-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1595333413-30052-2-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Aug 2020 16:59:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uqi28A=sm5+JhAqBM2OtBM3_XwvvkaKyEDVL9uVEioog@mail.gmail.com>
Message-ID: <CAD=FV=Uqi28A=sm5+JhAqBM2OtBM3_XwvvkaKyEDVL9uVEioog@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k60fG-008WDg-BX
Subject: Re: [Kgdb-bugreport] [RFC 1/5] tty/sysrq: Make sysrq handler NMI
 aware
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jul 21, 2020 at 5:10 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> In a future patch we will add support to the serial core to make it
> possible to trigger a magic sysrq from an NMI context. Prepare for this
> by marking some sysrq actions as NMI safe. Safe actions will be allowed
> to run from NMI context whilst that cannot run from an NMI will be queued
> as irq_work for later processing.
>
> A particular sysrq handler is only marked as NMI safe in case the handler
> isn't contending for any synchronization primitives as in NMI context
> they are expected to cause deadlocks. Note that the debug sysrq do not
> contend for any synchronization primitives. It does call kgdb_breakpoint()
> to provoke a trap but that trap handler should be NMI safe on
> architectures that implement an NMI.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/sysrq.c       | 33 ++++++++++++++++++++++++++++++++-
>  include/linux/sysrq.h     |  1 +
>  kernel/debug/debug_core.c |  1 +
>  3 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 7c95afa9..8017e33 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -50,6 +50,8 @@
>  #include <linux/syscalls.h>
>  #include <linux/of.h>
>  #include <linux/rcupdate.h>
> +#include <linux/irq_work.h>
> +#include <linux/kfifo.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/irq_regs.h>
> @@ -111,6 +113,7 @@ static const struct sysrq_key_op sysrq_loglevel_op = {
>         .help_msg       = "loglevel(0-9)",
>         .action_msg     = "Changing Loglevel",
>         .enable_mask    = SYSRQ_ENABLE_LOG,
> +       .nmi_safe       = true,
>  };
>
>  #ifdef CONFIG_VT
> @@ -157,6 +160,7 @@ static const struct sysrq_key_op sysrq_crash_op = {
>         .help_msg       = "crash(c)",
>         .action_msg     = "Trigger a crash",
>         .enable_mask    = SYSRQ_ENABLE_DUMP,
> +       .nmi_safe       = true,
>  };
>
>  static void sysrq_handle_reboot(int key)
> @@ -170,6 +174,7 @@ static const struct sysrq_key_op sysrq_reboot_op = {
>         .help_msg       = "reboot(b)",
>         .action_msg     = "Resetting",
>         .enable_mask    = SYSRQ_ENABLE_BOOT,
> +       .nmi_safe       = true,
>  };
>
>  const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
> @@ -217,6 +222,7 @@ static const struct sysrq_key_op sysrq_showlocks_op = {
>         .handler        = sysrq_handle_showlocks,
>         .help_msg       = "show-all-locks(d)",
>         .action_msg     = "Show Locks Held",
> +       .nmi_safe       = true,
>  };
>  #else
>  #define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
> @@ -289,6 +295,7 @@ static const struct sysrq_key_op sysrq_showregs_op = {
>         .help_msg       = "show-registers(p)",
>         .action_msg     = "Show Regs",
>         .enable_mask    = SYSRQ_ENABLE_DUMP,
> +       .nmi_safe       = true,
>  };
>
>  static void sysrq_handle_showstate(int key)
> @@ -326,6 +333,7 @@ static const struct sysrq_key_op sysrq_ftrace_dump_op = {
>         .help_msg       = "dump-ftrace-buffer(z)",
>         .action_msg     = "Dump ftrace buffer",
>         .enable_mask    = SYSRQ_ENABLE_DUMP,
> +       .nmi_safe       = true,
>  };
>  #else
>  #define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
> @@ -538,6 +546,23 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
>                  sysrq_key_table[i] = op_p;
>  }
>
> +#define SYSRQ_NMI_FIFO_SIZE    64
> +static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);

A 64-entry FIFO seems excessive. Quite honestly even a FIFO seems a
bit excessive and it feels like if two sysrqs were received in super
quick succession that it would be OK to just process the first one.  I
guess if it simplifies the processing to have a FIFO then it shouldn't
hurt, but no need for 64 entries.


> +static void sysrq_do_nmi_work(struct irq_work *work)
> +{
> +       const struct sysrq_key_op *op_p;
> +       int key;
> +
> +       while (kfifo_out(&sysrq_nmi_fifo, &key, 1)) {
> +               op_p = __sysrq_get_key_op(key);
> +               if (op_p)
> +                       op_p->handler(key);
> +       }

Do you need to manage "suppress_printk" in this function?  Do you need
to call rcu_sysrq_start() and rcu_read_lock()?

If so, how do you prevent racing between the mucking we're doing with
these things and the mucking that the NMI does with them?


> +}
> +
> +static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
> +
>  void __handle_sysrq(int key, bool check_mask)
>  {
>         const struct sysrq_key_op *op_p;
> @@ -568,7 +593,13 @@ void __handle_sysrq(int key, bool check_mask)
>                 if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
>                         pr_info("%s\n", op_p->action_msg);
>                         console_loglevel = orig_log_level;
> -                       op_p->handler(key);
> +
> +                       if (in_nmi() && !op_p->nmi_safe) {
> +                               kfifo_in(&sysrq_nmi_fifo, &key, 1);

Rather than kfifo_in() and kfifo_out(), I think you can use
kfifo_put() and kfifo_get().  As I understand it those just get/put
one element which is what you want.


> +                               irq_work_queue(&sysrq_nmi_work);

Wishful thinking, but (as far as I can tell) irq_work_queue() only
queues work on the CPU running the NMI.  I don't have lots of NMI
experience, but any chance there is a variant that will queue work on
any CPU?  Then sysrq handlers that aren't NMI aware will be more
likely to work.




> +                       } else {
> +                               op_p->handler(key);
> +                       }
>                 } else {
>                         pr_info("This sysrq operation is disabled.\n");
>                         console_loglevel = orig_log_level;
> diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
> index 3a582ec..630b5b9 100644
> --- a/include/linux/sysrq.h
> +++ b/include/linux/sysrq.h
> @@ -34,6 +34,7 @@ struct sysrq_key_op {
>         const char * const help_msg;
>         const char * const action_msg;
>         const int enable_mask;
> +       const bool nmi_safe;
>  };
>
>  #ifdef CONFIG_MAGIC_SYSRQ
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 9e59347..2b51173 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -943,6 +943,7 @@ static const struct sysrq_key_op sysrq_dbg_op = {
>         .handler        = sysrq_handle_dbg,
>         .help_msg       = "debug(g)",
>         .action_msg     = "DEBUG",
> +       .nmi_safe       = true,
>  };
>  #endif
>
> --
> 2.7.4
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
