Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799DF1AE6
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Nov 2019 17:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YO5tVGE0p5u0m1ELgjVAdV5Pjyitsb9dLd+naA9Es6U=; b=D+aBzAIzd8J8qjoJM4gsf9uWOw
	LUih5Btu1ZsYui6nw+yZqQrLWR6lU2kmisWoh1dM1ViXfY706nc6OJodB4lmSbLVuYXTqsdBR8ozk
	xLgDAXgWQrQ74FSIIKsaDCKEUqtgX4XBQM11uwnrR/2c+kum6HwSsFystUkYKabyMjcA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iSNvz-0001pP-P7
	for lists+kgdb-bugreport@lfdr.de; Wed, 06 Nov 2019 16:13:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1iSNv3-0001jO-U4
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 16:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YKC1kJOcWpyD+8pjGdr6zJNIwDWfqyBu/N6KBSP97U=; b=clVkmz/mbv49J6RyPlWABPgpee
 a0RP8Iv5B0p3cLxkN6JErW6qiPb9M/ZTTReOrn6p0WiWQSU1XzR1Ht59n4pP0qyrjm2OGd3osXMJO
 7wQS1MEZSscPvg5uPG30/dlvt88Wa3nh5ZGQyGegBueudiR7sHWts9VtcbHT+lKfRwr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6YKC1kJOcWpyD+8pjGdr6zJNIwDWfqyBu/N6KBSP97U=; b=MqbLgGQ7fZwCTo1cOFL+0sSeuN
 K7RYePi+Aes883m12kP/n87y3JZGW6AWrBi39q5w7Vn7WVDGwBeDnnvZAfAhGjwzG1fF1jelSMkgd
 lCZ/AsuvUYCy1TF/fCnfJ9GtzL7nU4j7ekRCQJ82cmQgFz/A1XFePPnZpwS5TP0aVKRQ=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iSNuy-002Uec-Ix
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 16:12:29 +0000
Received: by mail-pg1-f195.google.com with SMTP id l3so17443082pgr.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Nov 2019 08:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6YKC1kJOcWpyD+8pjGdr6zJNIwDWfqyBu/N6KBSP97U=;
 b=MpZHturjPCBg33iU1ozhAjvA8LCtPPFI3DR58OYlFEaUZGZqfEzhUtttDDrlEOGegQ
 4vDex9qExlxkA9WH33d8HwoxTLWivc69W/6aer4DXfteqgbtXwv3cNxCcRds4ZAMweGX
 5ZXj+X+FYkL8t+hZqh4LwhZRZNRrqod+Up3sqXtFrQSRV7C3Y69W33Z8X4jj1Fl7gbuY
 R6u824u7CLy//WZ/duinZirY1ifbAiK575WJqRiWdVx2qkiQPu6t7SWS7JDhyX5hOHLe
 oe8RLdwEfd46kke7TKQhcEtTSIZl2oUQhbinVc7bj3yYIQzIfU4ltgAEvZlXwG6aLosM
 UhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6YKC1kJOcWpyD+8pjGdr6zJNIwDWfqyBu/N6KBSP97U=;
 b=FO8bNCVuG99GCqFW04Y0PasWkjtoro0yXS0Aa6J5u/d4ryR2o4ilycOat8mNmi1rCw
 vQcqGJFgjE3P7Ld4S0E9KAv2r3shrzTyeBdf9iI3s9rRxMSdxC9ODaBlmEAQNTb6vBNM
 2CdRvVEYZBgA5j9OZsV6gnG7ItbAE6WoZRo9msoUc8js2I6ca2x4Or+Nt474lb2Htg+c
 Q/gzGNwHv14kEGgwCodUlzqvWs9g+iz2yr/KekH148An7ZvohetTxUayUfx3ABMiVazx
 xzRsOmOqHo9VgDO4ChRCfGRIpRPU10eK989ae2o5oftSJWt1M1UnyJRdxyju8kdP5vXC
 ZFdQ==
X-Gm-Message-State: APjAAAV+qlXYcm9JelLjaA2sbVoK8D+BKTVVXAtaTJJOTDZ/B8aD1w/N
 zwSUsZ++Lz9L1fSqvQZeA8TVbA==
X-Google-Smtp-Source: APXvYqwR0pSNn59pPusYKfkpnLRmR/vqqpv4L3qv+M0Onv9D6hRgWRQkxTVXtCrUTdykmM2sB1/Rnw==
X-Received: by 2002:aa7:908b:: with SMTP id i11mr4396653pfa.140.1573056738752; 
 Wed, 06 Nov 2019 08:12:18 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j4sm5535967pjf.25.2019.11.06.08.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 08:12:17 -0800 (PST)
To: Petr Mladek <pmladek@suse.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
Message-ID: <de8a397d-8660-4ace-9626-127debcf43a7@arista.com>
Date: Wed, 6 Nov 2019 16:12:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
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
X-Headers-End: 1iSNuy-002Uec-Ix
X-Mailman-Approved-At: Wed, 06 Nov 2019 16:13:26 +0000
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

On 11/6/19 8:35 AM, Petr Mladek wrote:
> On Wed 2019-11-06 03:04:51, Dmitry Safonov wrote:
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
> 
> Just to clarify. The problem in sysrq driver is a bit different.
> It modifies console_loglevel to show even less important message
> on the console.
> 
> IMHO, it should be solved by printing the header line with pr_error().
> It is not ideal. A cleaner solution might be to introduce another
> loglevel that will always get pushed to the console. But I am
> not sure if it is worth this single line.

I believe why it's not done - there is a comment in sysrq code that said
the userspace relies on the loglevel of sysrq messages (and may trigger
alerts from emerg/err log level):
  * Raise the apparent loglevel to maximum so that the sysrq header
  * is shown to provide the user with positive feedback.  We do not
  * simply emit this at KERN_EMERG as that would change message
  * routing in the consumers of /proc/kmsg.

But I don't mind any solution.

>>   Hung task warning before panic [2] - suggested by Tetsuo (but he
>>   probably didn't realise what it would involve).
>> o While doing (1), (2) the backtraces were adjusted to headers
>>   and other messages for each situation - so there won't be a situation
>>   when the backtrace is printed, but the headers are missing because
>>   they have lesser log level (or the reverse).
>> o As the result in (2) plays with console_loglevel for kdb are removed.
> 
>> The least important for upstream, but maybe still worth to note that
>> every company I've worked in so far had an off-list patch to print
>> backtrace with the needed log level (but only for the architecture they
>> cared about).
>> If you have other ideas how you will benefit from show_stack() with
>> a log level - please, reply to this cover letter.
> 
> I agree with all the other justification.
> 
> I would add. The backtrace is really useful for debugging. It should
> be possible to print it even in less critical situations.
> 
> I am afraid that many people use WARN() for this purpose. But WARN()
> is not always appropriate. WARN() misuse huts when panic_on_warn
> option is used.

Thanks, Petr.

-- 
          Dmitry


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
