Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8FCF80E2
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 Nov 2019 21:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYqfYS0sjNh/yHY5gr3JzqW3YukvlozD1D3GSj9P6OA=; b=YuS3xey9nkUPVl+MjddY74w1+O
	NokB4chYlnnpEjEy1eyFSQAdgKTP1tnlmfXgDTIjSxfV+6TO31tV2CCYGFCRsEtb2MmpYdMCpyTkU
	nG7RIKTNURs53nu/QjxE2yR70vfEUOfser6J/SG9C89DidUmsofidu7NXYyN4Hq0hfFs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iUG7D-0004EA-B1
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 Nov 2019 20:16:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1iUG7B-0004E2-8v
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 Nov 2019 20:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=; b=O8J64j9mMgbS6UinUn77EC5kU9
 ixw/Ze9C/e+Z0zPsNmOOmbMrOiQ/FU37oo8GgSE6NpgB53ww0B9hKqujHOuTVh/iO490SLU/25h++
 ZvHuqs3m+2VD4UdbEqYScmVRoFSDosUf/sYDC8DkMxIqEuKKgCUfmwMIJ7UiS7QwFbhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=; b=U8SeTQIfsa8u3wJhhrz1XdFmzF
 yzGXnnVGTd42jKdLQTU6LbntD+vQah9+Ddky0Tn37soVENfVq2Mjtm0UPo/a9EoClOuMt/JQQ7Zdz
 1ckMp8ae7xZ6SsfVKWRQlYknFb1mgy/fJB6D+z70ROiStWMDod+DjP3go+CyKLN4wK8E=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iUG78-00CVTB-4S
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 Nov 2019 20:16:45 +0000
Received: by mail-wm1-f67.google.com with SMTP id z19so615133wmk.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Nov 2019 12:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=cZIehrzGpUFezD2aa4zmv8OufN5OtO0USzsaArEEUTu0egX1JDp7fXq/MKdHB+YxUr
 j/kC7hgtECdh5x1noQBDdzd4zMsGonK7DNa4R/e8/R7qxcehDcLnLo5qSFE4wjuyW42o
 PQpFktb3ed0G2yVCt/fgkRLVHHWNH3ragHLlsd4kHSnraDACO77RcGzlulVu3SB7tcFm
 Ka75d1q24hYXLZJbDgNbGl6ynhrMJhmWegwmwjFp7I5D0Fg2d54s1iF9aPGxd1hnX+B8
 gISwE6rYfN65iX3ZaYqQ/BYKUKfAwSvjgwPgiFEkk/eO1PVC0atmmvIxVoVwNPzimOsY
 R2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=fZn/+plQNB2VZm1x7batDj+pSkohhHH5CLpH5oFYxMmCQG3mzOPMOQXCX3CTWp70V6
 LTjHTzJztDAFDrkbDtUBv0TflbobGN8qx5Uf5bEJDsl0jg4rOeUKCnTtP1azTSdCR+V3
 SsOIYr3CHK2zWqdSFFHdPoEksaPrvCgxfPzbubVutwo8tC6JOxOd5o9JR/VGVHBJvEQc
 4He4J3Acw7C6cFoqVpfKSN4XKh7wElNrNE/djTXTCWRC8LuV7OLYvejbOb5khkgwShYT
 qUvRNUVXOifu0zTkVaOLKWnad5QNcvjdSjDAI3qShzfIAEdE8AN1l2eZ2mVk00ZCNOVr
 GRog==
X-Gm-Message-State: APjAAAUKP8LS2cyJ7cMrEnA0rtV9NUwGCJUdf+6UsTf6cHiWeYi4dy1U
 jWpBmR2FIXAd/pQP5UMChZBN/w7brh00VQ==
X-Google-Smtp-Source: APXvYqwUswzQhu0DkD+M5khz/mFK8gHdabdOoahgxknZZUvPWQw4U7A4JmJR+GV6KsoYg/TOZHa6cQ==
X-Received: by 2002:a1c:2342:: with SMTP id j63mr585268wmj.56.1573501654084;
 Mon, 11 Nov 2019 11:47:34 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id f67sm723039wme.16.2019.11.11.11.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 11:47:33 -0800 (PST)
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Petr Mladek <pmladek@suse.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
Message-ID: <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
Date: Mon, 11 Nov 2019 19:47:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191111012336.GA85185@google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iUG78-00CVTB-4S
Subject: Re: [Kgdb-bugreport] [PATCH 00/50] Add log level to show_stack()
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
From: Dmitry Safonov via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Dmitry Safonov <dima@arista.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-snps-arc@lists.infradead.org,
 Fenghua Yu <fenghua.yu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jeff Dike <jdike@addtoit.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Sergey, Petr,

On 11/11/19 1:23 AM, Sergey Senozhatsky wrote:
> On (19/11/08 14:04), Petr Mladek wrote:
> [..]
>> I agree that it is complicated to pass the loglevel as
>> a parameter. It would be better define the default
>> log level for a given code section. It might be stored
>> in task_struct for the normal context and in per-CPU
>> variables for interrupt contexts.
> 
> I do recall that we talked about per-CPU printk state bit which would
> start/end "just print it" section. We probably can extend it to "just
> log_store" type of functionality. Doesn't look like a very bad idea.
> "This task/context is in trouble, whatever it printk()-s is important".

I don't see how bits on task_struct or in per-cpu are easier than
supplying a log level parameter down the stack.
How would it work if sysrq_handle_crash() called by key-press?
How would that interact with deferred printing?
How would it make visible prints from current context, but not from
something that preempted it?

Furthermore, what problems are you trying to solve with this design?
Only sysrq driver? Kdb?
In my perspective it sounds too complicated and over-engineered for
something that has two-three users.
Also I've tried to point that I need to print backtrace sometimes with
KERN_DEBUG loglevel to use it in production for early notices those
needs to go only to log files and currently each architecture decides
which log level it prefers.

And what's so complicated about this patches set? I see only side of the
testing, but the build-testing is covered with 0day bot and cost nothing
and any visible regression may be found during -next period.
While introducing those printk-sections may subtly break things.

I mean, I definitely know less about printk() and its internals than you
- so my points may be a no-sense.

What I'm going to do - is to fix all build and reported issues, I'll
send v2 this week and feel free to NAK it, I will forget about those
patches and won't be offended.
I don't see many people those are "hey, we'll benefit from this".
And doing this patches set was neither quite fun (dirty business), nor
something I can be later proud of (hey, I've introduced the log level
parameter to printing functions!).

Thanks,
          Dima


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
