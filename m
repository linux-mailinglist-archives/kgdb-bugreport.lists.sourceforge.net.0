Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD079625DAC
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Nov 2022 15:59:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1otVV9-0000FZ-Qz
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 11 Nov 2022 14:59:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mathieu.desnoyers@efficios.com>) id 1otVV8-0000FI-OA
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 11 Nov 2022 14:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r517KVYMKQ4ZYrMv0BzocmRX7Md1Y/icDUcYkt7DrXc=; b=M9/77UvyfMaB8vGzZ9IgpWm3L1
 JB4qhifCLVkzTUZrXgaKo5VujxHwdSuTQkgpUhcI+1Iae9aOpOk8KGv56Tc9Fvtm/0FeOL2RBp2Lm
 D//uEWLlIfpuih9p8EMRfRLcykZmdPSfvcWlbX0DRKGhQaOu9CF5mWt/NygpFKrB6S9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r517KVYMKQ4ZYrMv0BzocmRX7Md1Y/icDUcYkt7DrXc=; b=JFotKsJ76Ka7IbkkVK/XAxLVbt
 rye4VttifZP2pt6n+wi4kx8k3fAgX174yerWFUaPulwNl3KJ3mXAOoG5gmNNuwcAc3I+uSlyMwpSc
 sMdE+lYiintZ7FqV+kBJDL2fZ5jBPBC9lmosSQWpvB0CZLJuRV186ljIgld4v7hiGQ5U=;
Received: from smtpout.efficios.com ([167.114.26.122])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otVV5-004R26-15 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 11 Nov 2022 14:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
 s=smtpout1; t=1668177821;
 bh=EYvFyeYoIXdpRZUrDIt9Kwnd3gAkvdIgxw1lIXG8SKY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l66N3oiBVl0WpLOT0hkLWrSBLQJsJSW4+ouPxFZH5QD5KKmXDB6CMjzwtM8VVLLpX
 a4mvKpJXJiuV9Qw3ANDqSRII+7K5waLtTRLYZ90oeO3HFXyKJpVusI8jz1TOHWpOiX
 dJRcqsFN0mN40E/3U0KhejsRReLLA8QsqIZLb9mPKd4oL95EyLfXlhHXXYFtuTieM/
 mQitMOSC/OQ89QyOELCnHdOHRibH9OXvgNxVpUIxiREjJL0PTMu3jrCYcnxgmXCUU+
 h1vYvH07RGr00OmtJNBP+zQXctnrrr738WJXcAPDjU36sTOHtCkNno5wnO/vjAKkO+
 R+/kME1qSOXkw==
Received: from [172.16.0.153] (192-222-180-24.qc.cable.ebox.net
 [192.222.180.24])
 by smtpout.efficios.com (Postfix) with ESMTPSA id 4N81fh5HFrzgt1;
 Fri, 11 Nov 2022 09:43:40 -0500 (EST)
Message-ID: <02cdf436-6942-89a7-98b2-bfa75ba5f301@efficios.com>
Date: Fri, 11 Nov 2022 09:43:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20221107141638.3790965-1-john.ogness@linutronix.de>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-11-07 09:15, John Ogness wrote: [...] > > The base
 commit for this series is from Paul McKenney's RCU tree > and provides an
 NMI-safe SRCU implementation [1]. Without the > NMI-safe SRCU imple [...]
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1otVV5-004R26-15
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 00/40] reduce console_lock
 scope
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Joel Fernandes <joel@joelfernandes.org>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-um@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-11-07 09:15, John Ogness wrote:
[...]
> 
> The base commit for this series is from Paul McKenney's RCU tree
> and provides an NMI-safe SRCU implementation [1]. Without the
> NMI-safe SRCU implementation, this series is not less safe than
> mainline. But we will need the NMI-safe SRCU implementation for
> atomic consoles anyway, so we might as well get it in
> now. Especially since it _does_ increase the reliability for
> mainline in the panic path.

So, your email got me to review the SRCU nmi-safe series:

[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/log/?h=srcunmisafe.2022.10.21a

Especially this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=srcunmisafe.2022.10.21a&id=5d0f5953b60f5f7a278085b55ddc73e2932f4c33

I disagree with the overall approach taken there, which is to create
yet another SRCU flavor, this time with explicit "nmi-safe" read-locks.
This adds complexity to the kernel APIs and I think we can be clever
about this and make SRCU nmi-safe without requiring a whole new incompatible
API.

You can find the basic idea needed to achieve this in the libside RCU
user-space implementation. I needed to introduce a split-counter concept
to support rseq vs atomics to keep track of per-cpu grace period counters.
The "rseq" counter is the fast-path, but if rseq fails, the abort handler
uses the atomic counter instead.

https://github.com/compudj/side/blob/main/src/rcu.h#L23

struct side_rcu_percpu_count {
	uintptr_t begin;
	uintptr_t rseq_begin;
	uintptr_t end;
	uintptr_t rseq_end;
}  __attribute__((__aligned__(SIDE_CACHE_LINE_SIZE)));

The idea is to "split" each percpu counter into two counters, one for rseq,
and the other for atomics. When a grace period wants to observe the value of
a percpu counter, it simply sums the two counters:

https://github.com/compudj/side/blob/main/src/rcu.c#L112

The same idea can be applied to SRCU in the kernel: one counter for percpu ops,
and the other counter for nmi context, so basically:

srcu_read_lock()

if (likely(!in_nmi()))
   increment the percpu-ops lock counter
else
   increment the atomic lock counter

srcu_read_unlock()

if (likely(!in_nmi()))
   increment the percpu-ops unlock counter
else
   increment the atomic unlock counter

Then in the grace period sum the percpu-ops and the atomic values whenever
each counter value is read.

This would allow SRCU to be NMI-safe without requiring the callers to
explicitly state whether they need to be nmi-safe or not, and would only
take the overhead of the atomics in the NMI handlers rather than for all
users which happen to use SRCU read locks shared with nmi handlers.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
