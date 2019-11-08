Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04BF5196
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2019 17:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YVtXoX54DuUg4iG4Gt/C3FkE70WLiuYavCCg7NBqoE=; b=B0JDN0wTm3ivLg6ETp2nsn9Q7a
	YuejyGJ5BE3E+OWyat+796aFoIKWlNG7hiOPCTAa1Sw7rRdNczRMaOQnXUpoYPqNyuUfzMKo0Lst1
	XeefwC8/QQD0cKTyOg5N37WF2ExAR8lflvJx9OkzmVSNo1P1nC3DFACeitLymjXVSICU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iT7U4-0005jr-4m
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Nov 2019 16:51:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1iT7U2-0005jX-MR
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Nov 2019 16:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g8y3Kv95ejyL7msYqyPIoRMuCM9aKky/CsOCvaHvzKM=; b=Q7JOQzGi42EOHhIrzMqRmMtG8Q
 FwUFyA69TVeqmgNaD7Mc1arOebNK8LTOWCjFb4UJBLUMEAkUMKo2NLdoenmmS73Nrqu+p+otHZ4P3
 LyV8qmhnjS4g0YuQlubNq4atyqJkPUVWrP5Hh/xK26PjC1Gn7tL+5qo5QHx/+CuA5Lko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g8y3Kv95ejyL7msYqyPIoRMuCM9aKky/CsOCvaHvzKM=; b=cjeMvzptOWz0XYyWtiN6hwjBPk
 Dtro3wE35DbpX7ukfngcLUrNS3xCVn5VmrCBTgXgyBvoIvDyL1EArCC4/dQ5VsQf+wcabdefg4eEb
 xIkFVWK7WZ26dXZlafcdaHU9fbmizBIdzwOpJV+7wpm9VCrn0yzi6FLxip24S2GvMnYg=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iT7U1-0074UG-9h
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Nov 2019 16:51:38 +0000
Received: by mail-lf1-f68.google.com with SMTP id j14so4955784lfb.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2019 08:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8y3Kv95ejyL7msYqyPIoRMuCM9aKky/CsOCvaHvzKM=;
 b=OFQ83MN4Hmk627ztvJPIKihtIRsS8ZJ3GNTmqGPL14tUmqtruv4K7nmTrdqjRLFkAn
 v66F5LmIzidO2RY0wAc8faHozHlKmYZjXqnWdur1cdgyOYMMPWxMT2qM/13lV7Gll4Nc
 lRCKNQhkBNihdDdl1Z0mCUKrkPWWlSTJj8W9XuLLYhohd1gFs4UlSNvhCs93ZGZd3jBA
 FVTjYbasessxSjfBcyeOLdW+Y8Bd7gD+BB7UCWg2KPTCWA+UwS7+l7bzP+7BahjCAYhI
 nOv6jmxm+6mZbCk5AkWY13lz+e0hU9EGlWVlrK7ojQr4zo4A/XJr3HfWznngkwdMz6Mb
 pEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8y3Kv95ejyL7msYqyPIoRMuCM9aKky/CsOCvaHvzKM=;
 b=gtdE9ZVgQ4YxIm2ktQ/okMQN7m7b03dCtrbGDGc/9IIOEGDEMZ7BX+kpEjlaUB4j8l
 4kqh0az5ugHkjORt7yTMtpa3hqaMhze1bHpauE3Zw0VVeTOZ+o9Dp5D7pb+S+zYy+EfH
 NkqelZvEJshckTZyucr8sV24CqVb9sWThgIPDHeEkhHRmnID0ccFXgF38Qs55DcR8fJn
 ESh4Ip+Om6Y8pMbqGhFUXuDxmBNu/ahoXgLv+sDGRJpIFCSedZ9abXz8adH18cfzvgwn
 zmk5Ks/iSoaSrl6lBjKc5T8bAzCEyBvgT/uIczEEJHPThoVcJZ6wGc0uoNciESxRgYNA
 JV2A==
X-Gm-Message-State: APjAAAUWdYQvvqRNYvw69frfvkWhHNdVNaUcylBdtU3kgjtE1JMpAufl
 dUrsYOwouud7wqkZxVW5N/nd+ouHLZRaclyxOoHf8sb8
X-Google-Smtp-Source: APXvYqzHzf9qj/gQvrMhsVZj/mUBqCeBT0v/95hThrViwKN4rfJkI0AUVqq0YGCyoYWqoiClXSsdpDtSyx/K8KYU40o=
X-Received: by 2002:a19:ab11:: with SMTP id u17mr7519021lfe.78.1573230521103; 
 Fri, 08 Nov 2019 08:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
In-Reply-To: <20191106203440.GH3079@worktop.programming.kicks-ass.net>
Date: Fri, 8 Nov 2019 16:28:30 +0000
Message-ID: <CAGrbwDRgX1BZoFrVYSXhAeeUKHrB=q3w8jXFPOuRvO7HV4Ciqw@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iT7U1-0074UG-9h
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
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
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
 Petr Mladek <pmladek@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
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

On 11/6/19 8:34 PM, Peter Zijlstra wrote:
> On Wed, Nov 06, 2019 at 04:27:33PM +0000, Dmitry Safonov wrote:
[..]
>> Sorry, I should have tried to describe better.
>>
>> I'm trying to remove external users of console_loglevel by following
>> reasons:
>
> I suppose since all my machines have 'debug ignore_loglevel
> earlyprintk=serial,ttyS0,115200 console=ttyS0,115200' I don't have this
> experience.

Yeah, I remember you avoid all those functionalities of printk(), fair
enough. On the other side, regular users and I'm betting most of
the non-tuned distributions use /proc/sys/kernel/printk by default.
(Checking on my Arch & Fedora - loglevel 4 from the box)

>> - changing console_loglevel on SMP means that unwanted messages from
>> other CPUs will appear (that have lower log level)
>> - on UMP unwanted messages may appear if the code is preempted while it
>> hasn't set the console_loglevel back to old
>> - rising console_loglevel to print wanted message(s) may not work at all
>> if printk() has being delayed and the console_loglevel is already set
>> back to old value
>
> Sure, frobbing the global console_loglevel is bad.
>
>> I also have patches in wip those needs to print backtrace with specific
>> loglevel (higher when it's critical, lower when it's notice and
>> shouldn't go to serial console).
>
> (everything always should go to serial, serial is awesome :-)

Personally I agree. Unfortunately, here @Arista there are switches (I'm
speaking about the order of thousands at least) those have baud-rate 9600.
It's a bit expensive being elaborate with such setup.

>> Besides on local tests I see hits those have headers (messages like
>> "Backtrace: ") without an actual backtrace and the reverse - a backtrace
>> without a reason for it. It's quite annoying and worth addressing by
>> syncing headers log levels to backtraces.
>
> I suppose I'm surprised there are backtraces that are not important.
> Either badness happened and it needs printing, or the user asked for it
> and it needs printing.
>
> Perhaps we should be removing backtraces if they're not important
> instead of allowing to print them as lower loglevels?

Well, the use-case for lower log-level is that everything goes into logs
(/var/log/dmesg or /var/log/messages whatever rsyslog has settting).

That has it's value:
- after a failure (i.e. panic) messages, those were only signs that
something goes wrong can be seen in logs which can give ideas what has
happened.
- before the failure, those messages go to telemetry and can be
auto-magically processed remotely to take a decision (e.g. balance the
traffic away).

I wish all the information could be gathered in the userspace, but many
existing kernel/driver messages are valuable. A more detailed example is
hung task detector: we want to have the backtrace for a task that is
in uninterruptible state too long, but only in logs as printing on
serial console may lead to holding console lock and watchdog.
Besides customer notifications and investigations, I see the value of such
"bottleneck" warnings during long-running integration tests.

Thanks,
          Dmitry


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
