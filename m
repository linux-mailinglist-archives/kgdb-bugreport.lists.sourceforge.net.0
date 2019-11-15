Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13212FD217
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Nov 2019 01:50:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iVPon-0008A3-Qm
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 Nov 2019 00:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky.work@gmail.com>)
 id 1iVPom-00089w-U5
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Nov 2019 00:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vPNtAsB3gXKxK0gWaPZBn5Rp3HfCqb9+MUmX4aWZ2D4=; b=EUFnOqp4XJTWUYrjIcrW1b4v5i
 FPbmVunzFdZdHFEKBUSpMkOAyWtw7lMZsr61+55/7f0yu6LLyhp+TlJ33sguyAAL2qyv13GdAD1Ns
 XyoSmjDAdik9T767dQ89Sx6xUL6T+t5+JO7SQmkyh27M761NMvW6Ov/6//tCHixo8Syg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vPNtAsB3gXKxK0gWaPZBn5Rp3HfCqb9+MUmX4aWZ2D4=; b=CKmg7zH1CjPZDAWKSWGEfko3Jh
 dE3k6TncBRYQ8pGAg7/7Y3DErNL3WoSivWp01B6oDfbl3XfzvzFy6DQ9tWuzx1uUNfo1i9zlLVSTq
 8fLp1uMt1IOgHIm1cHPA9zsiB6/FYjSghaDSZfHcddg7aIob8xbNWx/ujQbo4/vabyE0=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iVPol-00HHWj-4E
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Nov 2019 00:50:32 +0000
Received: by mail-pf1-f196.google.com with SMTP id n13so5470722pff.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Nov 2019 16:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vPNtAsB3gXKxK0gWaPZBn5Rp3HfCqb9+MUmX4aWZ2D4=;
 b=KmyV0wmxO8hyWXeEcxKcQ9g8HAkhA/qdNPNsFVQfn2yQQaw88HTfL9LaYbMztbfLd7
 52Pu0wZdSH5VQCaovxyvQHk0OD3K8hwyJyv7gTIE7WfYFbfnBk0EdgJX1JDN4pxqrXgl
 ySMbute8meJ9NzhuhL1SAlrw8K7mPUp5drSPhW4XMcf1d4qZgHVwU+2rw50XjdktNSiF
 sXgm7kRa4irKvcghjdz42mh6HHtDdUpm74owHzVgf/ujVAH0IqCxtLXrybdOBUMLjKyu
 aagzgO7oGkNhda1hCKKFnixzMGqDsMvYc3bCAGLjTVnTtVkSC3NSs1N74SaX4ygndQ54
 O+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vPNtAsB3gXKxK0gWaPZBn5Rp3HfCqb9+MUmX4aWZ2D4=;
 b=hbN48b5FWwvuYTGxkflCDbxJl+XQE21iPXkQ9/6EcPCgV9SXJ+gPBuw22Vyx3Va/3a
 +s7UAZNYF1mTLR1zXWPE96aewpmlIpzxaeqyx9x515QWdklN0lw30D250v33qb2aSaJq
 jEwuEUAOPwXeXPn2sQ2FS/IvlcGfRbgyrTL3lQla9MLxQLuNW9Cd9DpClIExhNydsuop
 lE5qnqtIcYcLa4zwa0navX+aLPIjRzyxWd0dYx4LyHT+G617usPIFdwsiyodNH7Gku2C
 95MGeTy5m49/H+YiQmDEagoBpMBi1l5ynr/khEfIj1YTw8wNc+70GsP6XM3yan43QVR+
 p24w==
X-Gm-Message-State: APjAAAXwKbCFLCo6selyStZ51ZiRbGqwvxOLX4jcB4pdkfqRJOoAeaZ3
 GUyegmXeQ7XDr527/iS0ndg=
X-Google-Smtp-Source: APXvYqzs/6YJY3W3liGEvm6Y1c+pswB4gmlD11KAgZFkRk3IFiZFsVE0EZASQU/B8tJzNuq9YuYJSQ==
X-Received: by 2002:a62:ee0c:: with SMTP id e12mr14672743pfi.38.1573779025403; 
 Thu, 14 Nov 2019 16:50:25 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id s15sm3632564pjp.3.2019.11.14.16.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 16:50:24 -0800 (PST)
Date: Fri, 15 Nov 2019 09:50:22 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191115005022.GA144607@google.com>
References: <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com>
 <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
 <20191113063334.GA147997@google.com>
 <578d041a-3ce5-28bb-9fcc-cf90fe82b036@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <578d041a-3ce5-28bb-9fcc-cf90fe82b036@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky.work[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iVPol-00HHWj-4E
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

On (19/11/13 16:40), Dmitry Safonov wrote:
> It's also not very fun for me to create those patches.
> But they fix console_loglevel issues (I hope we could un-export it in
> the end) and also I need it for my other patches those will produce
> warnings with debug loglevel when configured through sysctl.

No objections.

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
