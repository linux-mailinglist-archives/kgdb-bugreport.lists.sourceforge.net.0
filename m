Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D58F2B8F
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 Nov 2019 10:55:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iSeW9-00088d-G0
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 Nov 2019 09:55:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1iSS1I-0004S8-Gg
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 20:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJrcQXptkMvPiExxcW5iB0NzeMYZeKfH93+EIxkwDzY=; b=ScRwZOz5cBCgndfRnNKphkJlnN
 sP+m8ULaPGQSpQo4a3W5+E/h9kUAn36DcJD4kdS9TVVcgaXnuTLId9WF2VJK+L0mIliJsVTNF+9P+
 iO1WGoTPLAn3D63dvzzmQS+g0a/udcOXySpDkhE58LOrp1bsproHLzGORKqhEuJgrKBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJrcQXptkMvPiExxcW5iB0NzeMYZeKfH93+EIxkwDzY=; b=UOeKruMRoLNA9N4aump1XroIsJ
 DFQlCpwXOJu12ZHfbzRVxucFwvGfBQ/krTk6RIZypoDg1C8r4/2F9kAa9QvCkmVZkizzYAbFPd8Vo
 g63lbw9Hg58+66YT8H47rmzhHHMrK/7YhA2kBtJCm1GskkIiGLHmJ2IVYjIiP3P+9xL8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSS1E-002mmi-9r
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 20:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJrcQXptkMvPiExxcW5iB0NzeMYZeKfH93+EIxkwDzY=; b=dLqPPOZnjveWBeyFqFHqrbtNZ
 Duw5YArJPTaMMMK8SsjUxFjkIDQhNUSGD5PvNQVqSS+e/GWXU1Um5AVf/5sUPjLz45CKuM0IRDAMs
 VJOI3PF4FsdFW2Mj099DRLCzazEzb+zrotnV0I1WVxXeWHoGdNsYMsg3hXOH54aFacQzs/oy4AisX
 0iQV33+aUEMHy+n5TIl+aUKiWMNj3wlvtrjuO4fCRVPkUgi8SKL+BQOZYBkn7NslBLpVF53Y5s7wl
 nyOBB1ExO8CnC6/BiF+fSyjnLlUc7UEIcgZ13IIdTf4f2/4oA2gULPIuZ+oV94CGzcp/+zHem6q8U
 4ISIm47TA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSS0p-0001aI-GA; Wed, 06 Nov 2019 20:34:43 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id C2126980DF5; Wed,  6 Nov 2019 21:34:40 +0100 (CET)
Date: Wed, 6 Nov 2019 21:34:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191106203440.GH3079@worktop.programming.kicks-ass.net>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iSS1E-002mmi-9r
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

On Wed, Nov 06, 2019 at 04:27:33PM +0000, Dmitry Safonov wrote:
> Hi Peter,
> 
> On 11/6/19 9:20 AM, Peter Zijlstra wrote:
> > On Wed, Nov 06, 2019 at 03:04:51AM +0000, Dmitry Safonov wrote:
> >> Add log level argument to show_stack().
> >> Done in three stages:
> >> 1. Introducing show_stack_loglvl() for every architecture
> >> 2. Migrating old users with an explicit log level
> >> 3. Renaming show_stack_loglvl() into show_stack()
> >>
> >> Justification:
> >> o It's a design mistake to move a business-logic decision
> >>   into platform realization detail.
> >> o I have currently two patches sets that would benefit from this work:
> >>   Removing console_loglevel jumps in sysrq driver [1]
> >>   Hung task warning before panic [2] - suggested by Tetsuo (but he
> >>   probably didn't realise what it would involve).
> >> o While doing (1), (2) the backtraces were adjusted to headers
> >>   and other messages for each situation - so there won't be a situation
> >>   when the backtrace is printed, but the headers are missing because
> >>   they have lesser log level (or the reverse).
> >> o As the result in (2) plays with console_loglevel for kdb are removed.
> > 
> > I really don't understand that word salad. Why are you doing this?
> > 
> 
> Sorry, I should have tried to describe better.
> 
> I'm trying to remove external users of console_loglevel by following
> reasons:

I suppose since all my machines have 'debug ignore_loglevel
earlyprintk=serial,ttyS0,115200 console=ttyS0,115200' I don't have this
experience.

> - changing console_loglevel on SMP means that unwanted messages from
> other CPUs will appear (that have lower log level)
> - on UMP unwanted messages may appear if the code is preempted while it
> hasn't set the console_loglevel back to old
> - rising console_loglevel to print wanted message(s) may not work at all
> if printk() has being delayed and the console_loglevel is already set
> back to old value

Sure, frobbing the global console_loglevel is bad.

> I also have patches in wip those needs to print backtrace with specific
> loglevel (higher when it's critical, lower when it's notice and
> shouldn't go to serial console).

(everything always should go to serial, serial is awesome :-)

> Besides on local tests I see hits those have headers (messages like
> "Backtrace: ") without an actual backtrace and the reverse - a backtrace
> without a reason for it. It's quite annoying and worth addressing by
> syncing headers log levels to backtraces.

I suppose I'm surprised there are backtraces that are not important.
Either badness happened and it needs printing, or the user asked for it
and it needs printing.

Perhaps we should be removing backtraces if they're not important
instead of allowing to print them as lower loglevels?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
