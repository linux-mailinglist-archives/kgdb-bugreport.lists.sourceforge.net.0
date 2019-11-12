Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C13F86F7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Nov 2019 03:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wijUVQTK3T4Ph3BZN+dCUDt7uvxcP4KBJlbah3fTrFE=; b=iRbKKTuLKkMJYlD0f7dheRgpDd
	IVtpLy825D7M6Nom5G9YBSY/qk9HtIRNCav6/q9v3R1UH+OMXuQxFfzt4igbcjSKeQdT8/ludFUoP
	jh8Oo730iBYC524YJ0Rkc/1kpp+BcJM78sCq2jpK957Ulfvx8lz8TxOk+yCmu3UppRLk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iUM6Y-0001ni-NZ
	for lists+kgdb-bugreport@lfdr.de; Tue, 12 Nov 2019 02:40:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1iUM6X-0001nX-Tm
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 Nov 2019 02:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=; b=ZSAdvrOADc57x+GnJV4aG+Iif3
 3Y5oCiEWsLXwGBwBtP35k5noYqCAaWg3FI2nLRFcwWy7KGA4yl2+Ep+vc1xIBUfrBLwjlNoTI/KHI
 MWElGyiNtUNDo/E+/F+yJQ891v3aNoUsemhVEcQ6QEV38W/tXGj0WlGJFP9JyodL9Lz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=; b=aC1c7uy+/g/RyqMhZm6Le4egL9
 6g4MpYWjUUm+uMF41sk/TjrO6A0pLWYY8Q6ZvJPdfUTp3LR+QuMxri/H1RtVdeOwKMtelxTcQDB1K
 03J4d48bT7GzeRHhLrK6dx9Lvv7zkqOg9cJDZYGhvPGeALdIFHs4dv4DaeTpGQ/3+7LQ=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iUM6U-00CqgA-K4
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 Nov 2019 02:40:29 +0000
Received: by mail-wm1-f68.google.com with SMTP id u18so1407533wmc.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Nov 2019 18:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=MX42aMTTzAgzmolo19ziCaVvJW01j4llkcsSSsPBgIZf5M/QJqFnu0ykgQ+YU9I1XM
 lWWUfFOOmvWQUbOV/+iKy4yX6WRH0x7F+7sbAobnLPJdwSzb9YWyJ9/pnJvSWZVMB+xV
 UFEneok+5nQrKqWY1H/ryexuorVth0ci9XQccgC0yNGEatwsWoLWkeJcz3zYnXhenkJH
 nhLbJhqGH8CSvC3ekwmNTkFJs9KRa26JVi5KOJ0GN3lmDlPGH14xef5YqFU0Sk8qUi0p
 NtXZ7DYgZXwHf2rN/1LtOFtVEw8aJlkAZJ8tf3acCKNzLndcz00BKo1YrVsWG4zo53JF
 Pi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=d80T8S8uZ5DUCX43RxRf53Mt5HRWx1sT6hdC4iVkQjGkYlsPT35ISbj+HcElFl14qq
 bg275sh1FM5ynDAjUfPJbvORj+L0PdZ7pXQ6X6ciofxkREA1TCMzx+z2u2iBXKlFOTSE
 oUlzzWmwV8q4S7ZjvjPnzDl4AP4qpeZPpbwiNuHpluQDwQQqhc+rPUDiD2Jks+gnXE6X
 OED03nIQsTOVPQuQEF4gpx02ePWYIPvoYdk4blJyyCztJ9ZtWNOSexrvG0QuqvotE3CV
 PKAo/Jf0nFK0Y48IKk8xkl4wEfx0f6nh9d+DWC9TRGwM/NYScMuuL6cNfI2/d/PWSB3H
 9Gzw==
X-Gm-Message-State: APjAAAWtxUqrvKXb3c/GqxoWgrtBOD4ZVwJusN3uA11gghRQTuYEHgMC
 1otRCyp3RNBejCzFobYMxXjJPw==
X-Google-Smtp-Source: APXvYqwGQmDILzErOejMnS6vcYmyu3aXwuweLJ3fDyVGcyV1rhcTRlJUkjSBJvf4yqYURAoU8N6Q/w==
X-Received: by 2002:a7b:c211:: with SMTP id x17mr1567811wmi.71.1573526420054; 
 Mon, 11 Nov 2019 18:40:20 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id u26sm1511046wmj.9.2019.11.11.18.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 18:40:19 -0800 (PST)
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
Message-ID: <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
Date: Tue, 12 Nov 2019 02:40:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112021747.GA68506@google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iUM6U-00CqgA-K4
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
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
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

Hi Sergey,

On 11/12/19 2:17 AM, Sergey Senozhatsky wrote:
> On (19/11/11 19:47), Dmitry Safonov wrote:
[..]
>> What I'm going to do - is to fix all build and reported issues, I'll
>> send v2 this week and feel free to NAK it, I will forget about those
>> patches and won't be offended.
> 
> Lovely.
> And - no, I'm not going to NAK platform specific changes. Just so you know.
> 
> *All* I'm talking about is an alternative, less "go and touch a ton of
> platform code" approach. The argument "I patched so many files that I'm
> not even going to discuss anything now" is not productive, to say the
> least. Hope this clarifies.

It probably was a wrong impression from the both sides.
My impression was "You touch every architecture - we won't even consider
that". Sorry for the the wrong impression from my side - I'm open for
discussion.

In my point of view the cost of one-time [mostly build] testing every
architecture is cheaper than introducing some new smart code that will
live forever. Though, again you and Petr understand more than me in
printk() code, so I'm not any insisting.

I'll reply to your suggestion tomorrow, it's a bit late in my tz.

Thanks,
          Dmitry


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
