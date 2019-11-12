Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE38F8791
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Nov 2019 05:45:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iUO31-0000Hv-Qw
	for lists+kgdb-bugreport@lfdr.de; Tue, 12 Nov 2019 04:44:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky.work@gmail.com>)
 id 1iUO30-0000Hg-DC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 Nov 2019 04:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=; b=VYSYNC648TdLRgeyIVhudzK9Dg
 xkdoJESiijiw+kzyjcR5dCm0XSintpfSJuvZ27FtmevqlN3n5ax64Tvoqj8pDzYBBnEp/2sUNPRsP
 mnDUejchEJiLktITEXDQjkKQqH2CNFoVEzNEkVpoy7BK1xVZKVLyjUXYpkba/POL5dSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=; b=Fi/UlthHqzJ+AC3G0z53ezMVFu
 tosPsg8xBpqkWaH+hTQdtPjhF2YS7u3F9L3fDZ5oLNYHn8vxVstVcMbLM8wxYCSv3A6hf9spG3W6m
 38JrmGabYhCWGgskIWqTtxi7G0a6LzCdFq+cBfHWI6jp0qD13cNarpa75jF9UJEgEnZg=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iUO2y-00GCfp-HG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 Nov 2019 04:44:58 +0000
Received: by mail-pf1-f193.google.com with SMTP id q26so12409085pfn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Nov 2019 20:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=;
 b=D8FdqJ91C9CViimFs5HkqTNzLfTnpza7YcDlJMaUW/GYDtbpWN+jf3gagVp5Pb54ut
 pJnpc/x6Rud5mFzPf0ZReA35hd11ljJ6cO/5F7Ue3e6hQ2TSEJ94YRDSGLm6NhnyCdqt
 CzzD2BCnxTXK5GtYHwa3Uusyd8eoRKj//LeZNogwczP3XkHhZ0DhI0uDpEhLu6Pcihhn
 H3BS+MU+Nl1Oowf4/jk8zWm4nc12KVZM+ffZ6sfZ7WtTjgYJy574lkrjNaKPgYx+dzhc
 p2jV1Cc9pO8ZsG8xspjchyhzIZQ4FAt5l5TNSRCxJncAjNaATr8g0kc1uRTSgUAVAp1B
 466Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=;
 b=nKi9pT6nElRxjsqlzgKPiZIMil7a2dH+ZXIk79GPL3uy0KTyzrApBr72oZJd8/VRwE
 OqaTUUr1cueYAr9bnf++W5MYEZ++aKJ0baGYyLHQ4nxvfztCAO1nlv+whmbsb/gwXVGi
 t143X5IY8wjsTEJqoJKqKW9lPoT81Am0vJRZaAk5fzA+4P2ShWbi0EgJYHJiS4xC4msq
 UPWwcVPt3kKFCvfP5a8dtcwIdLp4rq52W6ZTWubK+5iv/NCI8ap9t3bfBFrxc4ZuwpL5
 lflBvHIApIZ2V6KhpYMeqH4UAbxnJyTTU469RgcAtv6thZqS0gCvS0XbjLjDHuS0GjQG
 htUg==
X-Gm-Message-State: APjAAAU381h/5mCCLLCpUgbwlyxa3zgoC149mIr/eC5cEH5sCJ1IW4T2
 Q5BuWN1F0wotghmAnG9d4IY=
X-Google-Smtp-Source: APXvYqwNPlyjQTahvdEBWCuI4Zd+Adrk+027CcV4KySo2l3EKHcRsdH9n54f0hJl6o3TjoADo67N4w==
X-Received: by 2002:a63:d802:: with SMTP id b2mr32909872pgh.414.1573533890747; 
 Mon, 11 Nov 2019 20:44:50 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id l62sm18583061pgl.24.2019.11.11.20.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:44:49 -0800 (PST)
Date: Tue, 12 Nov 2019 13:44:47 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191112044447.GA121272@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky.work[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUO2y-00GCfp-HG
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Dmitry Safonov <dima@arista.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
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

On (19/11/11 10:12), Petr Mladek wrote:
[..]
> > I do recall that we talked about per-CPU printk state bit which would
> > start/end "just print it" section. We probably can extend it to "just
> > log_store" type of functionality. Doesn't look like a very bad idea.
> 
> The problem with per-CPU printk is that we would need to disable
> interrupts.

Or disable preemption and have loglevel per-CPU and per-context.
preempt_count can navigate us to the right context loglevel on
particular CPU. I'm talking here only about backtrace (error)
reporting contexts. Those can be atomic perfectly fine.

I posted a silly code snippet.

[..]
> But yes, this per-code-section loglevel is problematic. The feedback
> against the patchset shows that people want it also the other way.
> I mean to keep pr_debug() as pr_debug().

Hmm. Right.

> A solution might be to use the per-code-section loglevel only instead
> of some special loglevel.

So maybe we can "overwrite" only KERN_DEFAULT loglevels?
We certainly should not mess with SCHED or with anything in between
EMERG and ERR.

> The explicitly passed loglevel makes me feel more confident that
> all needed printk() calls were updated. But it might be a false
> feeling. I do not really have any strong preference.

I'm not like really objecting, just trying to explore some other
options.

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
