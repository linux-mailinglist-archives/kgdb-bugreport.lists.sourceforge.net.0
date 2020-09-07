Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4225FBE6
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Sep 2020 16:14:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kFHv2-0003lo-G5
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Sep 2020 14:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kFHv1-0003lh-42
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 14:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QqRdXLbNsyiLC26IMPUlFbXwycGvbHh7pYgLoGLtyg4=; b=Tc6+dVbsXghv0rAQsBksjSANA2
 UokLh65BW5rHD2zpWornAlX3Tul40sqsgfjNA5b0ul3CwsjOpFV18HFOjHr3pfq5lmqjYmxQ2tDw6
 fXQIut452sg7hYoRUBv+zkDFEGoYB85T2PIZMSyq/7vuqSEMwL+Mmjm/Y9PcYddSIU+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QqRdXLbNsyiLC26IMPUlFbXwycGvbHh7pYgLoGLtyg4=; b=Q2ejaMyIBljf2qBGw6agFwyTo/
 o1NG7uTRMBN2zCG8RDSaI7fCXjRYKxh8ET9HKtqdbH4/lBvr5mYLQt6mnwRNnSIt7WHuMCtCcBQu3
 OYNVbMiu50tv+mLOzqAWbPbhvG6QEbi9ienoKeKsrc06R9o3N/2H9Vv1nCrl4rYgOJIY=;
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kFHus-00FZcw-59
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 14:14:51 +0000
Received: by mail-ej1-f65.google.com with SMTP id z22so18381270ejl.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Sep 2020 07:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QqRdXLbNsyiLC26IMPUlFbXwycGvbHh7pYgLoGLtyg4=;
 b=sDvpzil3Gf7CH1I3z9v3YFEFyUo9UV34Ykm8/kSd127pXJnk1nBa2qMLorc9yEpNic
 rTe56xsIpMN/+Rnuf95br7T9aB1cPAxXhfICjV4uBKEbxoPE9Svpqge9nT2aEqxZ8ADM
 QT2UIoMDiNahSLGChc3utN8GNOBUWdl9Yijza4/+/KTjoI2Pve3k3KVnMREi+EcmEkxy
 m4XULLtYAZQ4vRh+ZUsp1ts4XBE1sq4tN1hzJpEZ5ep4Pj9P9awfxsj3t71v8pAjnw+6
 1aeaiA2YbMgH1kp7mHwYBwEZ3SIo7Cn/jmEWaZLtrwojKkZAdyrW0dH9GngyWN4p1e5j
 bl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QqRdXLbNsyiLC26IMPUlFbXwycGvbHh7pYgLoGLtyg4=;
 b=CqNVWZVmavb68D7hE7WprOec9weSL/jnp1u9m08GOjpRuJ/jlsYrEP6IOB7vNKSUFI
 Xfh2DVqD0/O3S1ur4oNmAM7pirpKXmIx7LZ5HyKLLTAxodO1jXR42Etvq+67BPTr+REj
 hvaRX0tQo1vc1zMGSyeQzsLAKh+Ee78/fEGbTf3LDMGvgOmCVxxh2IBZXaEaRAy28ke6
 lK+QUtFBwPbt2c040DluPNWCNgrqntVsZanNJHai0drQ9L2OSw0J+HMHhrP7kr57lJfU
 UxxxD6sM9kRyf0cedvsw6avAvLpQqdmd0xb0u3zD+yLGFOIw25+hDwhQHwFrtJBQ+ylb
 M3nw==
X-Gm-Message-State: AOAM530tkRXA848JBG726Il9fYElzjoaNmcgAkGlh/yNPl/fYkEkRv/v
 ae794VQrWZI3kzBmll7cRkfd5Rfc0YuG4Ev+
X-Google-Smtp-Source: ABdhPJz2iMdjK+R9m77aJniknbmvs6Ce2El/pj/PY4PWLuc+p8JZFWdzfM1Vy3/KUkXx422UrxG1oA==
X-Received: by 2002:adf:ec47:: with SMTP id w7mr2796302wrn.175.1599486376968; 
 Mon, 07 Sep 2020 06:46:16 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l8sm28893288wrx.22.2020.09.07.06.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 06:46:16 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:46:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Message-ID: <20200907134614.guc4tzj3knnihbe4@holly.lan>
References: <20200831193435.22141-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831193435.22141-1-dave@stgolabs.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kFHus-00FZcw-59
Subject: Re: [Kgdb-bugreport] [PATCH -next] kdb: Use newer api for tasklist
 scanning
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
Cc: Davidlohr Bueso <dbueso@suse.de>, kgdb-bugreport@lists.sourceforge.net,
 oleg@redhat.com, jason.wessel@windriver.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 31, 2020 at 12:34:35PM -0700, Davidlohr Bueso wrote:
> This kills the custom kdb_do_each_thread/kdb_while_each_thread
> calls used in kdb to iterate through all tasks. It is obsolete
> and racy to use tsk->thread_group, although in this particular

No objections to the change but kdb doesn't use tsk->thread_group,
it uses do_each_thread/while_each_thread. Can we change this to
say that is osbsolete and racy to use while_each_thread() (that's
pretty much what the description of the patch that introduced
for_each_thread said)?

Additionally the debug_core uses do_each_thread/while_each_thread.
Presumably that would like to be changed as well?


Daniel.



> case there is no concurrency so it doesn't matter. Still, lets
> trivially replace it for the newer one, maintaining semantics,
> of course.
> 
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---
>  kernel/debug/kdb/kdb_bt.c      | 4 ++--
>  kernel/debug/kdb/kdb_main.c    | 8 ++++----
>  kernel/debug/kdb/kdb_private.h | 4 ----
>  3 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> index 18e03aba2cfc..1f9f0e47aeda 100644
> --- a/kernel/debug/kdb/kdb_bt.c
> +++ b/kernel/debug/kdb/kdb_bt.c
> @@ -149,14 +149,14 @@ kdb_bt(int argc, const char **argv)
>  				return 0;
>  		}
>  		/* Now the inactive tasks */
> -		kdb_do_each_thread(g, p) {
> +		for_each_process_thread(g, p) {
>  			if (KDB_FLAG(CMD_INTERRUPT))
>  				return 0;
>  			if (task_curr(p))
>  				continue;
>  			if (kdb_bt1(p, mask, btaprompt))
>  				return 0;
> -		} kdb_while_each_thread(g, p);
> +		}
>  	} else if (strcmp(argv[0], "btp") == 0) {
>  		struct task_struct *p;
>  		unsigned long pid;
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 5c7949061671..930ac1b25ec7 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2299,10 +2299,10 @@ void kdb_ps_suppressed(void)
>  		if (kdb_task_state(p, mask_I))
>  			++idle;
>  	}
> -	kdb_do_each_thread(g, p) {
> +	for_each_process_thread(g, p) {
>  		if (kdb_task_state(p, mask_M))
>  			++daemon;
> -	} kdb_while_each_thread(g, p);
> +	}
>  	if (idle || daemon) {
>  		if (idle)
>  			kdb_printf("%d idle process%s (state I)%s\n",
> @@ -2370,12 +2370,12 @@ static int kdb_ps(int argc, const char **argv)
>  	}
>  	kdb_printf("\n");
>  	/* Now the real tasks */
> -	kdb_do_each_thread(g, p) {
> +	for_each_process_thread(g, p) {
>  		if (KDB_FLAG(CMD_INTERRUPT))
>  			return 0;
>  		if (kdb_task_state(p, mask))
>  			kdb_ps1(p);
> -	} kdb_while_each_thread(g, p);
> +	}
>  
>  	return 0;
>  }
> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index 2e296e4a234c..a4281fb99299 100644
> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -230,10 +230,6 @@ extern struct task_struct *kdb_curr_task(int);
>  
>  #define kdb_task_has_cpu(p) (task_curr(p))
>  
> -/* Simplify coexistence with NPTL */
> -#define	kdb_do_each_thread(g, p) do_each_thread(g, p)
> -#define	kdb_while_each_thread(g, p) while_each_thread(g, p)
> -
>  #define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
>  
>  extern void *debug_kmalloc(size_t size, gfp_t flags);
> -- 
> 2.26.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
