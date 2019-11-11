Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD3F7175
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 Nov 2019 11:10:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iU6eB-0002au-L1
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 Nov 2019 10:10:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky.work@gmail.com>)
 id 1iTyQk-00056k-P4
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 Nov 2019 01:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=meRRGW7ni43do21CnMh1ypMYB7GRo8yRghEKxpnOMtM=; b=RDsJx02E1qvaJdgOx4HzOEsHBr
 NupT5qqYF56wiSw6JahilHPbmWQNXJN/znLmCEznOgj+1uK4CaV0JSZavc9FX8svzS7oCsZRV/VUB
 qdkU6uCyQ4t27isFQ4+QGDRsK301qytSM6461JeWn1AB8w01rLMuFmoAboclVKUuhPIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=meRRGW7ni43do21CnMh1ypMYB7GRo8yRghEKxpnOMtM=; b=H1yTole9TQhueSOcJs/phdS3jd
 Z6QWio2e4VghntSceVNXeq9s1AFZnsawYK19R4xIQa1jJWBvlMRmT9wSmWEArIVsa0VlVNOTCflcM
 ibKFTFDLCLkgeAymj2WP1vuN80rhu5Xiu+Qa/irPYauNWiPCARG+NBjyW2ygwyhotnHs=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTyQj-00BI4N-CK
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 Nov 2019 01:23:46 +0000
Received: by mail-pg1-f195.google.com with SMTP id z188so2432590pgb.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 10 Nov 2019 17:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=meRRGW7ni43do21CnMh1ypMYB7GRo8yRghEKxpnOMtM=;
 b=PEUFO8IEu1osGIrKprDzvbxlNRJeZ7+VQZKgcPA4VWwOYdra1vch/X2sOCSKa29N9n
 VdblGN+C6xXZa66p438tGiFX2wH1ZMvXaLBCYR4jMYFYKpHWbu3dvuf4i51nfGHovAdM
 kJ21eWqlCVZNsUh7vR0KmZmoQmTZB1DoPsxQK2h0K8DrMvb84HP3pZHYPYw+F3AAOb8s
 2PUdw4923VWsoF2jPoVNv2KKLc7p6DTbwWWIyb/CwJRvDtzNsBcrU623traZ5+UDPhd8
 dvUZh/U5lV6A1081bATRr1q945s51Yb6awkYmElXIQG0WkPEPjbs1iqGD3WlzUt7rcka
 L5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=meRRGW7ni43do21CnMh1ypMYB7GRo8yRghEKxpnOMtM=;
 b=TmVu/ZQDGm4zgobH0HEny5LnZogGhasv9z/QxOK3dyTzckhBPyaYrXKE7JYQe+COWl
 sXu3S7UWxVoWDcApFY8ujioWjjA1dM6YiA4POT/D83cdpKPXXiTJE10vnMZaKT87GjW+
 ZH1hXvji9697BZdtLmcLs/L5SKXPfB2vrmYMskgHwfKZduxoCmoDEgWvpQ8xjKAB+bRz
 GhimDK5zD26plXQhuCY5lNyCysCgq0dRASv3aOmB/T6qxJBbd/WGF8mvZLjR9yBp0TMQ
 yK4yuzqytvB/ceor79Esod54zzlOyhiPvaVK0Mf0j0JezLQaJ8TcyZgEo8zouGFheXvM
 qNww==
X-Gm-Message-State: APjAAAVEVcRy93k55k/FqQZ6VZEsZept0pn00Ma8VQKQrcB2+s1LKph2
 B1OGiY2KpQ7wgwtso98lNfQ=
X-Google-Smtp-Source: APXvYqy6vC5fNwNO+7Jnp+tE/qbyOeavvD3kd+/MEwk8H/f5hGFY+WAM1K+Wsl4w+fZzo2o0jtZpqg==
X-Received: by 2002:a63:b047:: with SMTP id z7mr20331363pgo.224.1573435419566; 
 Sun, 10 Nov 2019 17:23:39 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id r8sm12584714pgr.59.2019.11.10.17.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2019 17:23:38 -0800 (PST)
Date: Mon, 11 Nov 2019 10:23:36 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191111012336.GA85185@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky.work[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1iTyQj-00BI4N-CK
X-Mailman-Approved-At: Mon, 11 Nov 2019 10:10:09 +0000
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

On (19/11/08 14:04), Petr Mladek wrote:
[..]
> I agree that it is complicated to pass the loglevel as
> a parameter. It would be better define the default
> log level for a given code section. It might be stored
> in task_struct for the normal context and in per-CPU
> variables for interrupt contexts.

I do recall that we talked about per-CPU printk state bit which would
start/end "just print it" section. We probably can extend it to "just
log_store" type of functionality. Doesn't look like a very bad idea.
"This task/context is in trouble, whatever it printk()-s is important".

Per-console loglevel also might help sometimes. Slower consoles would
->write() only critical messages, faster consoles everything.

Passing log_level as part of message payload, which printk machinery
magically hides is not entirely exciting. What we have in the code
now - printk("%s blah\n", lvl) - is not what we see in the logs.
Because the leading '%s' becomes special. And printk()/sprintf()
documentation should reflect that: '%s' prints a string, but sometimes
it doesn't.

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
