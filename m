Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA3F879E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Nov 2019 05:57:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iUOEt-0003S0-MB
	for lists+kgdb-bugreport@lfdr.de; Tue, 12 Nov 2019 04:57:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky.work@gmail.com>)
 id 1iUOEr-0003Rh-Ip
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 Nov 2019 04:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=; b=VVGf0B9OkjJ3DcMgtizNARwaKG
 WXQ9Fx2R6XMAUzbQYY7/u42JEbNDj9fRek5Y0XTcciaLgm7C3tDcXIqALwV1P1aDepeLLvFboMqpS
 h+zWX+8VOUZwZLN6ge9LYRcvMfAvM7/HGXT//B6MOLvKyruLiFqS72yC0PvBU43E6pbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=; b=AhDFo+Aui4kV09C28jYvx/K1KB
 57Ry2Kw/ZLaVWYFDr5DU7riWA7RcKZ/zDAczhWeM2Itzytnb3hfqN6N2uRMY5Rh/h58EFgRSQDL0f
 eXT2iizH7ngix1SwdipJxOFrJS5YS9ZRLWUsm+LL+D8NF3udCIH5dki5dray+8uCylE4=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iUOEq-00GD3k-EV
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 Nov 2019 04:57:13 +0000
Received: by mail-pg1-f193.google.com with SMTP id h4so11004017pgv.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Nov 2019 20:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=;
 b=AI85TZuxJFzpojKZJlquzPJ/5YvDFz8JEdaGZ7N9Bmfov5X7GyMy3TfvkUyQANtqKe
 uWjtNNrB596OMU00c6+qct2nMEsGN4W/ajrsVlovtW2vJG2fjivE6vkHc9d5Fc8S37eB
 0VpD+e7K/Ht0coC/nAVEUQFQLhXtyB4aw6jKMKF9ff8HzhVOsLQ13K9MvUH4nh17A3b8
 X0IG+zvP4YjZB9qcfjrPIBuuKfgEibO6DzaNR3cG8TZwz73XhoRwn86VlJzYDpndT6LU
 MtpcwxBGTg4+qOqVF/y48uFNpA2bAo7xyKsOHk/v6yI7+ZG1IGpxyK0r3md+ToHLMdrK
 mWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=;
 b=DrJoU885Y0jqm1hhb4RfDD2rZSZgM+5RU5yJqap5a9dhBNZfGRgmrnjQKOufOthSwW
 ZSamcuzMM2NwypW8SGN7F4f15FiSrpBeUeFRdJsbl+MqCcDaK5rGKZZN8EXO1XxgjuTR
 zAF0m8jgnoW+B58irGR/Fjh/V8CY5Pi3EmZMU1N46AaITIiBOvu0JtyQWQw1fhs/X+eR
 hqC6KNhCArJDj7Wv9/NOhKQyKGBeDGkZiFR/Q7xtEG4WDpyAk75RaGHUlVqopqft0ETg
 1XRikHvCHOnczAqzrJ7MGGpUi9p3o3G9+Bidlq/ZR665+RFZRov6UlX04DS7xCTDCGiO
 zo6g==
X-Gm-Message-State: APjAAAXmEptF9z6mF/xE62DxGI4RTMJTxd/IQn6bQbs3muN8k+493Mjf
 t2R+WLS1prngwLyDtgvTc+g=
X-Google-Smtp-Source: APXvYqwONZTehdk35XitEb5MFGQ3YaKV519c02Q5wasJGEVSNUQOf6OoebSn7yVrmWLCDumcSeljhQ==
X-Received: by 2002:a17:90a:f48a:: with SMTP id
 bx10mr3683941pjb.103.1573534626683; 
 Mon, 11 Nov 2019 20:57:06 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id n23sm15226461pff.137.2019.11.11.20.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:57:05 -0800 (PST)
Date: Tue, 12 Nov 2019 13:57:04 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191112045704.GA138013@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112044447.GA121272@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky.work[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUOEq-00GD3k-EV
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

On (19/11/12 13:44), Sergey Senozhatsky wrote:
[..]
> > But yes, this per-code-section loglevel is problematic. The feedback
> > against the patchset shows that people want it also the other way.
> > I mean to keep pr_debug() as pr_debug().
> 
> Hmm. Right.
> 
> > A solution might be to use the per-code-section loglevel only instead
> > of some special loglevel.
> 
> So maybe we can "overwrite" only KERN_DEFAULT loglevels?

LOGLEVEL_DEFAULT, LOGLEVEL_NOTICE, LOGLEVEL_INFO?

So we can downgrade some messages (log_store() only) or promote
some messages.

DEBUG perhaps should stay debug.

> We certainly should not mess with SCHED or with anything in between
> EMERG and ERR.

  [EMERG, WARN]

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
