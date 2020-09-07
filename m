Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B563825F162
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Sep 2020 03:12:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kF5iJ-0006fq-2Q
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Sep 2020 01:12:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1kF5iH-0006fZ-Gq
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 01:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sDpwqGqghN3hahccTt0JQa4R8tm2E5ApYutKoeBrco4=; b=i9apB0uGPJyUW+3UPTvLH7ojCK
 D7aCjGiKh0wVQ0Bh7EMcq9bTnjORgNtWEQ6NgxWpV/6AZKyoeKUNrAKDxzRzgt26JPy7J0ZHFKWZ6
 2FOAlsSPDdX78Ynht/TIhV4BrGK/OQhNeg+dXE+DZ3aIqaEVFwKdOA2zFKrLLaI1NdLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sDpwqGqghN3hahccTt0JQa4R8tm2E5ApYutKoeBrco4=; b=V9pfcS9oRurwSOesZObtSAyRHx
 jmgOfF1pv7rkC7Jg9W9rgEVch/KFYtTLF6TaKTB+i2qDuqbuApRDsG0aLrH2SNzrnHVwfaxYt3Ndi
 cMTIzAoVW0wKEPE9hgjehN/2CTG1xXOJ7RYuGgTMuwirqNUaXAYVNXOtdvZJ5sMSxBPk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kF5i5-00ErGf-UA
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 01:12:53 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6EA82080A;
 Mon,  7 Sep 2020 01:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599441156;
 bh=xyTSMPG3pyBCZv5zMohBYPXtrUS10O0YxLED9qNXz1I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=z4ctw8TGu/NMj1f6Hv2KXkrBHHa+hL7RZJDYAkBwkP7Zi0ELinKFYmIOB4m2bj+Br
 REdUI3oczw2sfJo0SbI9XIY3sEtUK+33VKxfvPvGwHzxwMucx5Nbb4xzObhrn0k+Zq
 pn0XJDjrIvvplQXYJSINInsZBA/KoOuJSe+bM3zE=
Date: Mon, 7 Sep 2020 10:12:26 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-Id: <20200907101226.ab0d00639be953e81d4576c2@kernel.org>
In-Reply-To: <20200819104655.436656-9-christian.brauner@ubuntu.com>
References: <20200819104655.436656-1-christian.brauner@ubuntu.com>
 <20200819104655.436656-9-christian.brauner@ubuntu.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kF5i5-00ErGf-UA
Subject: Re: [Kgdb-bugreport] [PATCH v2 08/11] kprobes: switch to
 kernel_clone()
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Kars de Jong <jongk@linux-m68k.org>, Matthew Wilcox <willy@infradead.org>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Tom Zanussi <zanussi@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, 19 Aug 2020 12:46:52 +0200
Christian Brauner <christian.brauner@ubuntu.com> wrote:

> The old _do_fork() helper is removed in favor of the new kernel_clone() helper.
> The latter adheres to naming conventions for kernel internal syscall helpers.

This looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you!

> 
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Alexandre Chartre <alexandre.chartre@oracle.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> ---
> /* v2 */
> unchanged
> ---
>  samples/kprobes/kprobe_example.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
> index 240f2435ce6f..a02f53836ee1 100644
> --- a/samples/kprobes/kprobe_example.c
> +++ b/samples/kprobes/kprobe_example.c
> @@ -2,13 +2,13 @@
>  /*
>   * NOTE: This example is works on x86 and powerpc.
>   * Here's a sample kernel module showing the use of kprobes to dump a
> - * stack trace and selected registers when _do_fork() is called.
> + * stack trace and selected registers when kernel_clone() is called.
>   *
>   * For more information on theory of operation of kprobes, see
>   * Documentation/staging/kprobes.rst
>   *
>   * You will see the trace data in /var/log/messages and on the console
> - * whenever _do_fork() is invoked to create a new process.
> + * whenever kernel_clone() is invoked to create a new process.
>   */
>  
>  #include <linux/kernel.h>
> @@ -16,7 +16,7 @@
>  #include <linux/kprobes.h>
>  
>  #define MAX_SYMBOL_LEN	64
> -static char symbol[MAX_SYMBOL_LEN] = "_do_fork";
> +static char symbol[MAX_SYMBOL_LEN] = "kernel_clone";
>  module_param_string(symbol, symbol, sizeof(symbol), 0644);
>  
>  /* For each probe you need to allocate a kprobe structure */
> -- 
> 2.28.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
