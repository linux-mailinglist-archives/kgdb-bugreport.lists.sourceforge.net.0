Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 696DA224668
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 18 Jul 2020 00:40:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwZ1a-0002hG-QM
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 22:40:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jwZ1Y-0002h1-Uo
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 22:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gA3W9/EKaokuj3jFwVb5OEfEmxf6jYHALcP6IdyTw1I=; b=MAlU8b8xCMJ9azx4fBj0Jradhx
 5XQ8y0y1FXM4DdjJiFDDkBdF/2MWsfHkFGJu4laAu7sCDNwz0VhFlfu9A/2MEWVMP1+EbGWuIeG7q
 0PFckeAfxI70AhssVt/7UqoZItoWssJjR9NEfMavgCSutF5a+A1agBcf7Led4B/gLFdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gA3W9/EKaokuj3jFwVb5OEfEmxf6jYHALcP6IdyTw1I=; b=R7f4tZlFJ9Lqe78/Auo78K7vV4
 glVWM1bNdIhu2Y7ixfWM6xRf2rZTT7zFgSJQQlu9T5szTLyz3+Urd5vamSrhbCmCN5Znjpw0A0eiT
 4BQ+eRxyM06Xy/0El4JFjSLe7PLpxtEF0ojOe7eO4UCZXlJZ7rGmX5dkDCn7lZ8SjK7w=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwZ1X-00CkiS-Np
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 22:40:12 +0000
Received: by mail-vs1-f65.google.com with SMTP id k7so5653265vso.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Jul 2020 15:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gA3W9/EKaokuj3jFwVb5OEfEmxf6jYHALcP6IdyTw1I=;
 b=YPU/L86uLVmNYa0mhJqzuT1kf9M8daLhh8Cgv07+W9/aDqUK0RQjf82G6ZPWfE7eZY
 YlDbWyF9ww1h7uDiZMrhIJMrIXUWa/cVZVuQdDo9T/omFFCVOX+rt7bXfZ8UhsCB+sMr
 WaYqdsxUpmWmdJ8eWYAjxEivq29Rtr6HjkF3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gA3W9/EKaokuj3jFwVb5OEfEmxf6jYHALcP6IdyTw1I=;
 b=XFaS5ytNp5EgiAooC/Q/lGkc0IdoNXXITS5L1S4EwWp7+Fa1q9RbkkYjdelGZoME4l
 4XhDvD5I9ZFP+eBrBBl6J5JodxXv3QGo5LAxQu7PZaKeia5DlvlMuB6DoqRFDE1x7o4H
 TxleCer963bHGowwQ98u3YIpHJVLzfzGUgsI6Pwm8ywY7iG3QxhWMm0K+RStHeptR5Fh
 gubnxCXQaJp8KaTiIOJnub+1Pr3sDPANA1grw6hf/kbzF63x5yCsGU3K5npr7easUfFN
 cRBkFZNdfP+s+WHDlNOFmc05m0UOMLyml8/4T77RjRcVGerRqmNWzKDTj4L2exN7LwFz
 67qg==
X-Gm-Message-State: AOAM532aUIYxPsd5ifSVsSxyB6EKKG01N4tpYJzZrKUXc5btAvAUWP6z
 x8FSRP94Ao1Yv37VS8VD1+pvv0KxG7A=
X-Google-Smtp-Source: ABdhPJy6CNWQtxrva8A5YZEK4GT/WQKHkt3nn99PWqRJlXtKRIAW3fc1g/kYepKmQ5qLw6eqD5zhhA==
X-Received: by 2002:a67:7d44:: with SMTP id y65mr9105956vsc.172.1595025604766; 
 Fri, 17 Jul 2020 15:40:04 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id q11sm1498711vkn.47.2020.07.17.15.40.03
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 15:40:04 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id m18so2454741vkk.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Jul 2020 15:40:03 -0700 (PDT)
X-Received: by 2002:a1f:9d57:: with SMTP id g84mr9238455vke.100.1595025603034; 
 Fri, 17 Jul 2020 15:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
 <20200716151943.2167652-3-daniel.thompson@linaro.org>
In-Reply-To: <20200716151943.2167652-3-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 15:39:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDVjwy5=OiDCrMbn8o9N5GGMiG8JnL0j+9fy3m5Vf4Eg@mail.gmail.com>
Message-ID: <CAD=FV=UDVjwy5=OiDCrMbn8o9N5GGMiG8JnL0j+9fy3m5Vf4Eg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwZ1X-00CkiS-Np
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/3] kgdb: Use the kprobe blocklist
 to limit single stepping
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
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Jul 16, 2020 at 8:20 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> If we are running in a part of the kernel that dislikes breakpoint
> debugging then it is very unlikely to be safe to single step. Add
> some safety rails to prevent stepping through anything on the kprobe
> blocklist.
>
> As part of this kdb_ss() will no longer set the DOING_SS flags when it
> requests a step. This is safe because this flag is already redundant,
> returning KDB_CMD_SS is all that is needed to request a step (and this
> saves us from having to unset the flag if the safety check fails).
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  include/linux/kgdb.h        |  1 +
>  kernel/debug/debug_core.c   | 13 +++++++++++++
>  kernel/debug/gdbstub.c      | 10 +++++++++-
>  kernel/debug/kdb/kdb_bp.c   |  8 ++------
>  kernel/debug/kdb/kdb_main.c | 10 ++++++++--
>  5 files changed, 33 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 7caba4604edc..aefe823998cb 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -214,6 +214,7 @@ extern void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc);
>
>  /* Optional functions. */
>  extern int kgdb_validate_break_address(unsigned long addr);
> +extern int kgdb_validate_single_step_address(unsigned long addr);
>  extern int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt);
>  extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
>
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 133a361578dc..4b59bcc90c5d 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -208,6 +208,19 @@ int __weak kgdb_validate_break_address(unsigned long addr)
>         return err;
>  }
>
> +int __weak kgdb_validate_single_step_address(unsigned long addr)
> +{
> +       /*
> +        * Disallow stepping when we are executing code that is marked
> +        * as unsuitable for breakpointing... stepping won't be safe
> +        * either!
> +        */
> +       if (kgdb_within_blocklist(addr))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  unsigned long __weak kgdb_arch_pc(int exception, struct pt_regs *regs)
>  {
>         return instruction_pointer(regs);
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index 61774aec46b4..f1c88007cc2b 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -1041,8 +1041,16 @@ int gdb_serial_stub(struct kgdb_state *ks)
>                         if (tmp == 0)
>                                 break;
>                         /* Fall through - on tmp < 0 */
> -               case 'c': /* Continue packet */
>                 case 's': /* Single step packet */
> +                       error = kgdb_validate_single_step_address(
> +                                       kgdb_arch_pc(ks->ex_vector,
> +                                                    ks->linux_regs));

I'm a little confused.  Isn't this like saying "if
(i_am_standing_in_acid) dont_step_into_acid"?

Specifically you're checking the _current_ PC to see if it's in the
blocklist, right?  ...but you've already (effectively) dropped into
the debugger at that location, so if it really was a problem wouldn't
we already be in trouble?

What you really want (I think?) is to know if the instruction that
you're stepping into is in the blocklist, right?  ...but you can't
know that because it requires a full instruction emulator (that's why
CPUs have "single step mode").

I guess you get a marginal benefit if someone manually set their
instruction pointer to be an address in the middle of a blocklisted
function and then trying to step, but I'm not sure that's really
something we need to add code for?

It feels like the right solution is that the architecture-specific
single-step code should simply consider a single-step through a
blocklisted area to be a step through one giant instruction.


> +                       if (error != 0) {
> +                               error_packet(remcom_out_buffer, error);
> +                               break;
> +                       }
> +                       fallthrough;
> +               case 'c': /* Continue packet */
>                         if (kgdb_contthread && kgdb_contthread != current) {
>                                 /* Can't switch threads in kgdb */
>                                 error_packet(remcom_out_buffer, -EINVAL);
> diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
> index ec4940146612..4853c413f579 100644
> --- a/kernel/debug/kdb/kdb_bp.c
> +++ b/kernel/debug/kdb/kdb_bp.c
> @@ -507,18 +507,14 @@ static int kdb_bc(int argc, const char **argv)
>   *     None.
>   * Remarks:
>   *
> - *     Set the arch specific option to trigger a debug trap after the next
> - *     instruction.
> + *     KDB_CMD_SS is a command that our caller acts on to effect the step.
>   */
>
>  static int kdb_ss(int argc, const char **argv)
>  {
>         if (argc != 0)
>                 return KDB_ARGCOUNT;
> -       /*
> -        * Set trace flag and go.
> -        */
> -       KDB_STATE_SET(DOING_SS);
> +
>         return KDB_CMD_SS;
>  }
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 5c7949061671..cd40bf780b93 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1189,7 +1189,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
>                      kdb_dbtrap_t db_result)
>  {
>         char *cmdbuf;
> -       int diag;
> +       int diag, res;
>         struct task_struct *kdb_current =
>                 kdb_curr_task(raw_smp_processor_id());
>
> @@ -1346,10 +1346,16 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
>                 }
>                 if (diag == KDB_CMD_GO
>                  || diag == KDB_CMD_CPU
> -                || diag == KDB_CMD_SS
>                  || diag == KDB_CMD_KGDB)
>                         break;
>
> +               if (diag == KDB_CMD_SS) {
> +                       res = kgdb_validate_single_step_address(instruction_pointer(regs));

Is it legit to use instruction_pointer() directly?  Should you be
calling kgdb_arch_pc()  ...or does that just account for having just
hit a breakpoint?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
