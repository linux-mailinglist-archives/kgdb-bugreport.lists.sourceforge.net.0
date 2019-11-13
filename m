Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D7FA6DD
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 13 Nov 2019 03:52:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iUilG-0005mM-I7
	for lists+kgdb-bugreport@lfdr.de; Wed, 13 Nov 2019 02:52:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky.work@gmail.com>)
 id 1iUilE-0005lg-J6
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 Nov 2019 02:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mAEGoUcf015Kc1YtW4ruE+InFHxWlwYn7gbBVyirKYs=; b=WCHGrlfl2GcZl/8q3yKwoSMKQh
 dwX4rbVC6oJ2jetPduBglwOZUj16ACKmSv8YsdXtDg2oY378jBijCIT5MW2Q15VKYp+WCbSHfzMKY
 FvXnikjmoK+d4uxF8a1e8m0y2HyX6+XGcIpa9ntTCh2ivNelCnsqT2OI+9P3dhcEKz78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mAEGoUcf015Kc1YtW4ruE+InFHxWlwYn7gbBVyirKYs=; b=mCaVGDuQ6Jyjb6ElP9U5WfU/Tb
 tYtK64KIPAP1bvVSQ6YMGkPl2FWf6saD3i+GSKMyMERPtf/hGFLE3FPN9cA5i87B4RbSzMN2lWyVw
 iIgeQ5T8qDXLctRyuR+LsUkJnEmiufpir6ng5l37fUjfXl/Nkd9IU8qZTMOMGxKzce5A=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iUilD-000PBc-CI
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 Nov 2019 02:52:00 +0000
Received: by mail-pl1-f193.google.com with SMTP id l4so396902plt.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 Nov 2019 18:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mAEGoUcf015Kc1YtW4ruE+InFHxWlwYn7gbBVyirKYs=;
 b=XXCh/lzhc9PTzZMC0vGMEKaB6i1csVlUbqsH9rt47YYmIE3wdFLdN1RZ9XLo0Arau9
 DFSxYtIImotqP13tsBpRhqb8n2/Js3UmCNvM723O76JsU3YeDgNvB62RSmDR472f865P
 t1QAOVBhx+MjcLVo2R7QGZwppOQAhnDe5pnFM8bcC1mQYP4Xfr9JZq5mLce2CdFOCSHQ
 84njoBNSpMDUUGTsuJ77DSMbJh6PdBhKnrYmuC5XmJlJhZH9X7UWxpAWc2QurRhXPwj/
 RNRLsIyLkoYPXcQN5wrdc5lLemIanQ8txwfErNc3g/3wLnhyIhyW/Sj8BqL1ib+dXaLC
 deQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mAEGoUcf015Kc1YtW4ruE+InFHxWlwYn7gbBVyirKYs=;
 b=gK98n0jP3Y/5pvS9OWGEMK34E7SoJZKG/kf5kTULtQ4GIJiFubd1S7tkH0yyNyIKE2
 0Z2XJt0tj7v9/Z9k5eKxVxgWJiJKd2I1Ci5gX6iL0+wNDTVavpEcaA8i2YGjGDTPxkBr
 TZJIySzAQ3BbzwZFBf4JQlPETCX/YQMeokj2ZjlZgfd8fXTXBpAY+evBCPVSeCTGvXw1
 HxZoMyd+li+VFATTDWT0qov3VwKAvV02GU38EFzurdw+bzGqsHhvyDmK5kBa5ukG9lDg
 Nc8KpjHaVrm7tOaDbIWm/0d1RKFH42QeRJ8t76RsVsxyVqp4ZkTLkazfrrIsuObTtnzG
 pwmQ==
X-Gm-Message-State: APjAAAV3di5fooYPIRrk0Ws5/vXcLRxTFVBZp5/b+HH3QJsObNUuvOOk
 uEu95uDraztcb9VPC8MaO3k=
X-Google-Smtp-Source: APXvYqyYgp5zwm8PfyC8ptc3y1M5FnRWqZNijSFiWVlVB0inT58a3/TsEELAtnKC4KW8B7tYLJSv2Q==
X-Received: by 2002:a17:902:fe06:: with SMTP id
 g6mr1170542plj.159.1573613513522; 
 Tue, 12 Nov 2019 18:51:53 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id b1sm463002pjw.19.2019.11.12.18.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 18:51:52 -0800 (PST)
Date: Wed, 13 Nov 2019 11:51:50 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191113025150.GA101113@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
 <20191112042546.GA119579@google.com>
 <d828cb62-aeea-4d67-33ba-b3a93ea10a3d@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d828cb62-aeea-4d67-33ba-b3a93ea10a3d@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky.work[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUilD-000PBc-CI
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
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
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
 Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>,
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

On (19/11/13 02:41), Dmitry Safonov wrote:
[..]
> 
> I don't strongly disagree, but if you look at those results:
> git grep 'printk("%s.*", \(lvl\|level\)'
> 
> it seems to be used in quite a few places.

Yes, you are right, it is used in some places. That's why I said
that I'd prefer to keep that number low (minimize it). But it's
not 0 (that ship has sailed).

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
