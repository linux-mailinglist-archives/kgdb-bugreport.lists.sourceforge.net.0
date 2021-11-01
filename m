Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFDD442125
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Nov 2021 20:56:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mhdQ3-00067I-38
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Nov 2021 19:56:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1mhdQ2-00067C-Lh
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Nov 2021 19:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sesa2n7BRx7ff2rAiAnxY9lr07K+lfskV6JL7f2ZDR0=; b=iZl4zogp5kmCdxLQUkFe1jvtAH
 7khmQAHB1GUf/XdO33Fs8W4iYnVTP0jwUx9y8r3xVRTWVZZuVzboCaDekENdRCMSUKjM6aghMfMQ9
 HyoesMChpHXeWr8QyhCO4JGoLoKvytJtFYXCPnYCSse7c20Uf3nfskzLztbWtQwAQ5TI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sesa2n7BRx7ff2rAiAnxY9lr07K+lfskV6JL7f2ZDR0=; b=UY4knewdFAuedIyk2eyGFmy+wN
 38p/l7H3flQCg8EMpN2tLSNuGyyMjYlK2qMaNcZ1rDuuhAGpaW+5Yy4m1kE1lfaAYEP6Bg0NRmWAT
 wX7Wqf0U8rCZiRgj1pyX7lTEo/LgxAGF1H06GpCRH/OYRnVmapjfscVLR0ErKhjeQiRU=;
Received: from mail-il1-f169.google.com ([209.85.166.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mhdQ0-00CjnY-N3
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Nov 2021 19:56:33 +0000
Received: by mail-il1-f169.google.com with SMTP id l8so1833566ilv.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Nov 2021 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sesa2n7BRx7ff2rAiAnxY9lr07K+lfskV6JL7f2ZDR0=;
 b=aTiZJoG3UbqEJ+VMckDQWZ3JxrAVVmZQbnTgBT4A8kwRoc6IjcFRJXP5QpBs32Q1W7
 f2+F3ZBis+OR3TtXku+hEntoUdr5NjIUXoF7wcPN13vvbMvJVQPP4k/TjHYej/Zz+quO
 KT/KrCYO4pM3vO0+0M74ESp3LS3idUSn+JbS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sesa2n7BRx7ff2rAiAnxY9lr07K+lfskV6JL7f2ZDR0=;
 b=kvWuU7QniESoq+J1c0Xavsv+FazmAqMKzgsssZXbVxR7cNIzAJ2RutCF15dP7WCtj9
 AHN7qzvibeLgOozaabnmF1SO1AHor8CGi/XwT2GqIXZfkiDmB9pa6iLs1C4zKvzvEEgG
 zcswQuDjf9kCnaeeSVuCxtz7qcenHp5F+MOw3Ya7KXD9DsUb+UqsuUzVacaCwchftBLg
 zEsP5makuTJTIbtvdF0TibXhwbaTaDTiJGlrUBm6Y0W6sbNGuP10Kw/LmJD2fmNDVqi/
 lEYpJ218PtzUVPO0oe2+aKVsmIPA/AXKWCTQ7kFv+KYm02TTQD3UB6cvL3D6E2bonzdk
 tVVQ==
X-Gm-Message-State: AOAM532XYZsRcD/CpgPtOTio/YXlY4lTZ2W3AOkb4k5dWz01/LPLFgFM
 gQ0eHO5dQRt5520ljGqn5KfAjO0yh4fJ6A==
X-Google-Smtp-Source: ABdhPJzK0RX3fNFE/y12oT2WBZJFpzh9ZwSllVtRaFlvpzqqoSfRYMp5bdiw2rtSno1AXiji0yVOBQ==
X-Received: by 2002:a05:6e02:12c2:: with SMTP id
 i2mr22294892ilm.223.1635796586926; 
 Mon, 01 Nov 2021 12:56:26 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173])
 by smtp.gmail.com with ESMTPSA id e17sm9453023iow.18.2021.11.01.12.56.26
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 12:56:26 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id j28so13265749ila.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Nov 2021 12:56:26 -0700 (PDT)
X-Received: by 2002:a05:6e02:18ce:: with SMTP id
 s14mr9870241ilu.142.1635796585764; 
 Mon, 01 Nov 2021 12:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211101174344.3220974-1-daniel.thompson@linaro.org>
In-Reply-To: <20211101174344.3220974-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Nov 2021 12:56:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVV4n4sDziWRbY517Eb8mRJVxwH+ggxf37FXfYKiTJ6A@mail.gmail.com>
Message-ID: <CAD=FV=VVV4n4sDziWRbY517Eb8mRJVxwH+ggxf37FXfYKiTJ6A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Nov 1,
 2021 at 10:44 AM Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > Currently kdb contains some open-coded routines to generate a
 summary > character for each task. This code curre [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.169 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.169 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mhdQ0-00CjnY-N3
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Adopt scheduler's task
 classification
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>,
 jing yangyang <jing.yangyang@zte.com.cn>, kgdb-bugreport@lists.sourceforge.net,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Nov 1, 2021 at 10:44 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kdb contains some open-coded routines to generate a summary
> character for each task. This code currently issues warnings, is
> almost certainly broken and won't make sense to any kernel dev who
> has ever used /proc to examine task states.
>
> Fix both the warning and the potential for confusion by adopting the
> scheduler's task classification. Whilst doing this we also simplify the
> filtering by using mask strings directly (which means we don't have to
> guess all the characters the scheduler might give us).
>
> Unfortunately we can't quite match the scheduler classification completely.
> We add four extra states: - for idle loops and i, m and s sleeping system
> daemons (which means kthreads in one of the I, M and S states). These
> extra states are used to manage the filters for tools to make the output
> of ps and bta less noisy.
>
> Note: The Fixes below is the last point the original dubious code was
>       moved; it was not introduced by that patch. However it gives us
>       the last point to which this patch can be easily backported.
>       Happily that should be enough to cover the introduction of
>       CONFIG_WERROR!
>
> Fixes: 2f064a59a11f ("sched: Change task_struct::state")
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Notes:
>     v3:
>     - Fix the uninitialized cpu variable (Doug and 0-day CI bot)
>     - Added a Fixes: (Doug)
>     - Changed "state I" -> "state -" and "state M" to "state [ism]"
>
>     v2:
>     - Fix the typos in the description (Doug)
>     - Stop trying to bend to world so I can keep 'I' exactly as
>       it was before. Instead we now replace 'I' with '-' and
>       fully adopt the scheduler description of tasks. kdb
>       it an interactive tool, not ABI so this is OK. (Doug)
>     - Don't try to enumerate all possible letters in the
>       comments and help. You can learn what to filter from
>       the output of ps anyway, (Doug)
>     - Fix the sleeping system daemon stuff.
>
>  kernel/debug/kdb/kdb_bt.c      |  14 ++--
>  kernel/debug/kdb/kdb_main.c    |  35 +++++-----
>  kernel/debug/kdb/kdb_private.h |   4 +-
>  kernel/debug/kdb/kdb_support.c | 118 +++++++--------------------------
>  4 files changed, 51 insertions(+), 120 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> index 1f9f0e47aeda..3368a2d15d73 100644
> --- a/kernel/debug/kdb/kdb_bt.c
> +++ b/kernel/debug/kdb/kdb_bt.c
> @@ -74,7 +74,7 @@ static void kdb_show_stack(struct task_struct *p, void *addr)
>   */
>
>  static int
> -kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
> +kdb_bt1(struct task_struct *p, const char *mask, bool btaprompt)

(Copied from v1 review):

In the comment above this function there is still a reference to
"DRSTCZEUIMA". Update that?


> @@ -2271,37 +2271,30 @@ static int kdb_cpu(int argc, const char **argv)
>  void kdb_ps_suppressed(void)
>  {
>         int idle = 0, daemon = 0;
> -       unsigned long mask_I = kdb_task_state_string("I"),
> -                     mask_M = kdb_task_state_string("M");
>         unsigned long cpu;
>         const struct task_struct *p, *g;
>         for_each_online_cpu(cpu) {
>                 p = kdb_curr_task(cpu);
> -               if (kdb_task_state(p, mask_I))
> +               if (kdb_task_state(p, "-"))
>                         ++idle;
>         }
>         for_each_process_thread(g, p) {
> -               if (kdb_task_state(p, mask_M))
> +               if (kdb_task_state(p, "ims"))
>                         ++daemon;
>         }
>         if (idle || daemon) {
>                 if (idle)
> -                       kdb_printf("%d idle process%s (state I)%s\n",
> +                       kdb_printf("%d idle process%s (state -)%s\n",
>                                    idle, idle == 1 ? "" : "es",
>                                    daemon ? " and " : "");
>                 if (daemon)
> -                       kdb_printf("%d sleeping system daemon (state M) "
> +                       kdb_printf("%d sleeping system daemon (state [ism]) "

super nitty: elsewhere you use "ims", not "ism". Can you be consistent
and change the above to "ims"?


 @@ -2742,8 +2743,8 @@ static kdbtab_t maintab[] = {
>         },
>         {       .name = "bta",
>                 .func = kdb_bt,
> -               .usage = "[D|R|S|T|C|Z|E|U|I|M|A]",
> -               .help = "Backtrace all processes matching state flag",
> +               .usage = "[<state_chars>|A]",
> +               .help = "Backtrace all processes matching whose state matches",

"matching whose state matches" sounds odd. Clean it up and use the
saved chars to document "A":

.help = "Backtrace all processes whose state matches (A=all)",


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
