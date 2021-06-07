Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7439D9F7
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Jun 2021 12:45:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lqCkw-0000rz-CF
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Jun 2021 10:45:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lqCkv-0000rr-30
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Jun 2021 10:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aqlB3nweefXMBd+1n3TfVg5Imk7mqG7GGko5Cn1Ypjk=; b=ERpnAfg1Z+jc/759vCenfPC+3s
 Ls2ZMnOce/9COGN2sVrGDbj81HB8u1qdizjf/dtmtsmjReqwyLFrlq9BJ8Th9s8PeUYn1gYBzy4Xv
 WjhZ7mpQ8w25Tu0Al5MYdClJ9o2J+2mlkiU7iKUxDymKbZlOMtHyfIZws4lyesDyRzLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aqlB3nweefXMBd+1n3TfVg5Imk7mqG7GGko5Cn1Ypjk=; b=lJZPRZ1ToD2rw2ztxeRulqKWsT
 f1aeYS6TT6/0dw1fTQxaD8vATQDq9pPk4zT+E7bqp6zEC08WUn6Ct1TDOl5aciEM5L0HlpRLfnUeL
 HMMH9SP9Ko6VPkIKoDeOi4d3zik7AIvFEjWzLnMgX5Ib8xPfwaiecRbTbXEH73cQDJz0=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lqCko-00DrFj-4w
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Jun 2021 10:45:20 +0000
Received: by mail-wr1-f53.google.com with SMTP id a20so17087300wrc.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Jun 2021 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aqlB3nweefXMBd+1n3TfVg5Imk7mqG7GGko5Cn1Ypjk=;
 b=fokBrG+2G1fkq/XmZlW8Qn8gNsGVee/kxIBq16SYHHcihUEHhxAiLiYioDzjZCKPWV
 9QEZOxcXx7fkFSqzCPab9ejYwiSWHFrBFKIvS4T83XVPbmSdXZpWw/7QLttpVgGupn7M
 FoWs2xbakjWUMbWyKY9toPvBiRJY2NSMoomhdLwJgft1TVJGXI1KGV/tNqHpK+0t4K/c
 ssThtjIQ5Gd6U2Vgt07NOm/v5UajEDZu6QDpCKD4dz0UaryRPm6OwVwk+zBYdDwhZepP
 9jCgvqxA0rUhD0TtVGl/Sk+NMb0qRwm6JS3LOkQ+swNNoK5wt0XeTzNUgGulkw29L99w
 ZQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aqlB3nweefXMBd+1n3TfVg5Imk7mqG7GGko5Cn1Ypjk=;
 b=Sv1EC6bj5MqYGn9HR0xtJxi3Xc9YrOTdCMTHEu293Z0awF/Fva8DB3FfRH2uBMxb/W
 sV5v54XhSImXbClEbTilhBkSoL626tiyUWikeTdzlU+SI8EmYtNN2laBWblUz70DVmcd
 vdj3rmtHenjo5omBN/DkuHuU1YEzRNc7iLmymIByqmPU07BGP1oAHrdbxqjvi/ZqhXNm
 R7Z1KI/94EIMVvNaIPGtXR9udGbsT5PkPRFh+0mQei7AfGA+f6YNI7l7PF16a2cR2EyY
 5BVbOGV1lhWgubleXVktv0p0sP+rCkC8Z/VzyCisY4ZqL0FDmk0gYJ7uLVRThXdGKCOJ
 huoQ==
X-Gm-Message-State: AOAM533rnu99MfK1qZh3YY/U1Wh+ISOSvr2CFpxpRUax5nFBjykYwKY+
 wFK7pRdJ15zNAH7sPh1aUfzACw==
X-Google-Smtp-Source: ABdhPJwqNBSGH0k0cJir/i3kAe7gRK7bFBO/b5hmcAfd7Z+SvyV8tZwYe+ey/npaVItqY9949tYt3w==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr16068224wrz.59.1623062703694; 
 Mon, 07 Jun 2021 03:45:03 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id p16sm16000678wrs.52.2021.06.07.03.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:03 -0700 (PDT)
Date: Mon, 7 Jun 2021 11:45:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210607104500.sopvslejuoxwzhrs@maple.lan>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.587042016@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602133040.587042016@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lqCko-00DrFj-4w
Subject: Re: [Kgdb-bugreport] [PATCH 6/6] sched: Change task_struct::state
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Pavel Machek <pavel@ucw.cz>, Mike Snitzer <snitzer@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Ben Segall <bsegall@google.com>,
 linux-mm@kvack.org, dm-devel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Zefan Li <lizefan.x@bytedance.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>, netdev@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, Alasdair Kergon <agk@redhat.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Vincent Guittot <vincent.guittot@linaro.org>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Jakub Kicinski <kuba@kernel.org>, John Stultz <john.stultz@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-pm@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Waiman Long <longman@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 03:12:31PM +0200, Peter Zijlstra wrote:
> Change the type and name of task_struct::state. Drop the volatile and
> shrink it to an 'unsigned int'. Rename it in order to find all uses
> such that we can use READ_ONCE/WRITE_ONCE as appropriate.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  ...
>  kernel/debug/kdb/kdb_support.c |   18 +++++++------
>  ...
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -609,23 +609,25 @@ unsigned long kdb_task_state_string(cons
>   */
>  char kdb_task_state_char (const struct task_struct *p)
>  {
> -	int cpu;
> -	char state;
> +	unsigned int p_state;
>  	unsigned long tmp;
> +	char state;
> +	int cpu;
>  
>  	if (!p ||
>  	    copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
>  		return 'E';
>  
>  	cpu = kdb_process_cpu(p);
> -	state = (p->state == 0) ? 'R' :
> -		(p->state < 0) ? 'U' :
> -		(p->state & TASK_UNINTERRUPTIBLE) ? 'D' :
> -		(p->state & TASK_STOPPED) ? 'T' :
> -		(p->state & TASK_TRACED) ? 'C' :
> +	p_state = READ_ONCE(p->__state);
> +	state = (p_state == 0) ? 'R' :
> +		(p_state < 0) ? 'U' :

Looks like the U here stands for Unreachable since this patch makes it
more obvious that this clause is (and previously was) exactly that!

Dropping the U state would be good since I guess this will show up as a
"new" warning in some tools. However it was a preexisting problem so with
or without this cleaned up:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

> +		(p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
> +		(p_state & TASK_STOPPED) ? 'T' :
> +		(p_state & TASK_TRACED) ? 'C' :
>  		(p->exit_state & EXIT_ZOMBIE) ? 'Z' :
>  		(p->exit_state & EXIT_DEAD) ? 'E' :
> -		(p->state & TASK_INTERRUPTIBLE) ? 'S' : '?';
> +		(p_state & TASK_INTERRUPTIBLE) ? 'S' : '?';
>  	if (is_idle_task(p)) {
>  		/* Idle task.  Is it really idle, apart from the kdb
>  		 * interrupt? */


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
