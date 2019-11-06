Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2DF2B8E
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 Nov 2019 10:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVUExYJO2yK35q077NuZrosqHvZdqaM/ZATOPB9YVnE=; b=Nhgo8EGP0kUEf5cacoRqEyF6vl
	aEoLWqyNSwxEdpnrKQ599EQJO92pGoERKC7pF3LaTdHotbxYsQe5x85oMDf0VuYKod+GpIH68KbKQ
	hd1TEElnuS5BOD6dmuCv0hzbP95bYUNhTLK5iuRyCeRWylEo4W+ym+UTPV/YOqRB8gGU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iSeW9-00088U-EX
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 Nov 2019 09:55:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1iSOA7-0002Rd-Vb
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 16:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ILRv70ifsS4R/1VQKE/+LZSUA7puynZg3ILLVfy9hZk=; b=Wr67hmGXJskkZ1mH1ntFsJ7Ofq
 2hGZWvFnCt2TDB4wQ3V3TkVrsEzLHr9MbbhDtRJwEa5o/GaFkWkt1mKUFJobOSkR+/ndEUeKNsTTO
 44CfUAXWgRfGFuYwMNBCOjf8QdQAYjwcY2zKqJ/+zbUtoIgItAKUEt7Op5Z/JhTQtIqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ILRv70ifsS4R/1VQKE/+LZSUA7puynZg3ILLVfy9hZk=; b=aWv375Q90h8T3zKtawwCuEe1eK
 pUzkpTTHfGUC+sgzYugOncFaGTktb3hISudcPqwoaSXUdP4NbTUc9I97U9TKOaY2cvtkQnKPpVuWR
 IxJ4pny802VHPVIV/4xYIX3c7AuJtmpwSCBiRDYtpA5n7PTDH/GkA42u3F/GfdMl3MoA=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iSOA6-002YI2-CU
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 16:28:03 +0000
Received: by mail-pg1-f196.google.com with SMTP id k13so6161439pgh.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Nov 2019 08:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ILRv70ifsS4R/1VQKE/+LZSUA7puynZg3ILLVfy9hZk=;
 b=CdDAyQ43Jv36qsn9EkuUTZw8nt/+mOBKFoXfvdiENDFswTz54lmUElxhgNjniKxvLI
 izkIqTz62/+BsaxfKUgZ8S2RMG637jnDm+u0E1aGEUIzsEbWwsDV18EKNobslN2UlmYW
 WhC8g2REeIsonwoMKiOWl5u0CwVw1KGMvWwvlr5qjl4PZWOYWYsDg5p9F3UN6uGx7U/X
 y0XyKjPvcy9QpHnBDaHHpgbyRB/umgRbu9qBjoNr1nlR2d6FHD+lGiNEfvnrob7yl41T
 Rb+d5GPnNkrUNEfbqJzu6sSRExc4iKzcT+7U+xgq+doooMPjYjmc+eE6U7r6YPGlvf7O
 nVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ILRv70ifsS4R/1VQKE/+LZSUA7puynZg3ILLVfy9hZk=;
 b=cDCeVkGs7hKE2j34TISx6BThVhEoVUOvggdDPwnNoEc4MAeFD1C7PbEkMkEf3C7uK+
 EH4ew1XMeDM9B424VgUrMDxTnu4U6i008f9/Yeqe9hyEPSuN7lX2bfeqHl61AMopBkyB
 Qx0Hiyp7J49PJBCwqUndHHnrod6pcbEOMM6nO9zWaBQcR/lhAJy45fVOHGK6qawFnqPx
 fQAE5jYtiOTDA27vWd8UxuO3OG6SpTpMaZ0LB80gcyZrCHOybYkuxUdiyn0IJesEIwux
 angvtwEM+tihjD4ic3o+zVtnGCsXJ9aj7lTj5zhAdMUU9Lnr0ekIBRw6gCo9UPPIWIrJ
 Vlxw==
X-Gm-Message-State: APjAAAWOSLD+BQH3sH2rcHGHHzGkW2v30vPRZtirHGe9MgI035ja0P/1
 toQGpbTfUVd4OPz8swKQ9fdjrQ==
X-Google-Smtp-Source: APXvYqwbfJs+Rexz1GsgVLAw54LaKdVOAeh16aFzChJ5nDbwhrH1h0946xekzcVYBN4WN+Q23T6sbg==
X-Received: by 2002:a63:66c1:: with SMTP id a184mr3898212pgc.164.1573057676186; 
 Wed, 06 Nov 2019 08:27:56 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id m15sm21253387pgv.58.2019.11.06.08.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 08:27:55 -0800 (PST)
To: Peter Zijlstra <peterz@infradead.org>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
Message-ID: <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
Date: Wed, 6 Nov 2019 16:27:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106092039.GT4131@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSOA6-002YI2-CU
X-Mailman-Approved-At: Thu, 07 Nov 2019 09:55:52 +0000
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
 Petr Mladek <pmladek@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
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

Hi Peter,

On 11/6/19 9:20 AM, Peter Zijlstra wrote:
> On Wed, Nov 06, 2019 at 03:04:51AM +0000, Dmitry Safonov wrote:
>> Add log level argument to show_stack().
>> Done in three stages:
>> 1. Introducing show_stack_loglvl() for every architecture
>> 2. Migrating old users with an explicit log level
>> 3. Renaming show_stack_loglvl() into show_stack()
>>
>> Justification:
>> o It's a design mistake to move a business-logic decision
>>   into platform realization detail.
>> o I have currently two patches sets that would benefit from this work:
>>   Removing console_loglevel jumps in sysrq driver [1]
>>   Hung task warning before panic [2] - suggested by Tetsuo (but he
>>   probably didn't realise what it would involve).
>> o While doing (1), (2) the backtraces were adjusted to headers
>>   and other messages for each situation - so there won't be a situation
>>   when the backtrace is printed, but the headers are missing because
>>   they have lesser log level (or the reverse).
>> o As the result in (2) plays with console_loglevel for kdb are removed.
> 
> I really don't understand that word salad. Why are you doing this?
> 

Sorry, I should have tried to describe better.

I'm trying to remove external users of console_loglevel by following
reasons:
- changing console_loglevel on SMP means that unwanted messages from
other CPUs will appear (that have lower log level)
- on UMP unwanted messages may appear if the code is preempted while it
hasn't set the console_loglevel back to old
- rising console_loglevel to print wanted message(s) may not work at all
if printk() has being delayed and the console_loglevel is already set
back to old value

Sysrq driver changes console_loglevel because it needs to print message
with a specific log level (the code said userspace relies on this).
Kdb changes console_loglevel to print backtrace as the log level depends
on architecture realisation.

I also have patches in wip those needs to print backtrace with specific
loglevel (higher when it's critical, lower when it's notice and
shouldn't go to serial console).

Besides on local tests I see hits those have headers (messages like
"Backtrace: ") without an actual backtrace and the reverse - a backtrace
without a reason for it. It's quite annoying and worth addressing by
syncing headers log levels to backtraces.

Thanks,
          Dmitry


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
