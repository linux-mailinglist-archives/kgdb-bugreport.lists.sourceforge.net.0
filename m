Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E9398ABB
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 15:33:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loQzb-0005uX-El
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 13:33:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1loQzZ-0005uQ-I9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 13:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+0GJIyUeezLFp/ym4/vP+fC11EDSc+9M3QstIcNFnoM=; b=WtB1dyGuCx/MiE8JJnfVBOBi1g
 /d+mQIo4QbkSltouBe17CT3tFZX0SkFY7xWi9ervYxOTE8H5V2KFA1vZt3/Qu7pa9i6bEEhj+cKLj
 HpaJV9eDgrFPQfyhkSUIZGd6y1AAbi1FEZFOVRLt9J5J/BA26ARax1Jb4OuuC9ih239s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+0GJIyUeezLFp/ym4/vP+fC11EDSc+9M3QstIcNFnoM=; b=ahuw/HB3s8dbiweiz/8kf+TrHI
 Fmi7emobD5Svc2SWWWpGMWAGoMzQouIx/DWtzGHOD/Q0p24Wvt5+VIWKUgTDnQkUr7PflEPagEQbC
 RyCbbF9onusViPR6qg5idEUmQBW1JmtkD5YaiHbSNgdEJ3SiQnBgpgLRZVfJvvjEts38=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loQzY-007F9P-C5
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 13:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+0GJIyUeezLFp/ym4/vP+fC11EDSc+9M3QstIcNFnoM=; b=HwUP711Hi7fk/GRlHwhhfYuQB5
 K5vYCOeQPuOhkpRqo74FjxBE7Qmwx8Wj6GWtoLKoGosJHAwdRgo9jNLQy1TmIkJWwpfsGoVcLemhp
 yE/DBMFhvtilIfo4dv1JJaSo/mfYt/uX/LfisWcd+3wnlJLAvfkdTdiO1+HtsYKFPZ/tV6bjzqFeK
 4bo4vY52aoMqPrC7we688zYhvu7+dOw4A1kcJpeVTuCoCOtBGxbR88VN+otXu+yI9l3xV+f66r/TA
 vzFWO4ght7JIQB07yN0JwJ0Lzx83FvV5EUgJ9xU0ODmz2KYDDLO3n44qTW1zqH17jqyBTMXum4Ngk
 tEM+eMIg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1loQxh-00B8o5-Il; Wed, 02 Jun 2021 13:31:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A4DFC30008D;
 Wed,  2 Jun 2021 15:31:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 90C662C08A5B8; Wed,  2 Jun 2021 15:31:04 +0200 (CEST)
Message-ID: <20210602131225.336600299@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 02 Jun 2021 15:12:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [24.132.217.100 listed in zen.spamhaus.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1loQzY-007F9P-C5
Subject: [Kgdb-bugreport] [PATCH 0/6] sched: Cleanup task_struct::state
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
Cc: Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Zefan Li <lizefan.x@bytedance.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Joel Fernandes <joel@joelfernandes.org>,
 netdev@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Alasdair Kergon <agk@redhat.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org, x86@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, John Stultz <john.stultz@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-pm@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Waiman Long <longman@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Tejun Heo <tj@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi!

The task_struct::state variable is a bit odd in a number of ways:

 - it's declared 'volatile' (against current practises);
 - it's 'unsigned long' which is a weird size;
 - it's type is inconsistent when used for function arguments.

These patches clean that up by making it consistently 'unsigned int', and
replace (almost) all accesses with READ_ONCE()/WRITE_ONCE(). In order to not
miss any, the variable is renamed, ensuring a missed conversion results in a
compile error.

The first few patches fix a number of pre-existing errors and introduce a few
helpers to make the final conversion less painful.




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
