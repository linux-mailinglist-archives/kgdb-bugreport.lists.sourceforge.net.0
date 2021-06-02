Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D311E398D43
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 16:38:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loS15-0007Lo-BQ
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 14:38:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <peterz@infradead.org>) id 1loS13-0007Lh-QR
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Subject:Cc:To:
 From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAgXF5452HulRjyD+JrT6Ce1EM30lHGgXf0FUiEeuf8=; b=QoYdyxsYHmG9o2Tg+knp12rBnl
 c1/1hmmENXMIA5gdMnyEyY0QU8SXUO1OjfJ4Z/PgN20RghbzvBQJmx9mr5kwhIhuJgVlWjG/yQssA
 eiXsXmXvdiTlJburpp8tScofC2h/09HjhS7mmHOvB9eqZlCjhURpq9EB58Q6Rty6lM2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xAgXF5452HulRjyD+JrT6Ce1EM30lHGgXf0FUiEeuf8=; b=b
 TP5LQQtXBN3OcZAJNCBQnTpEu9nHUCK/6wHN5Bspcm64jjC44wjpcjSV1socvHG6URc/HgwhV64gI
 +S41edDZ/NX1dt66ylWXXes9YwohD4Z9lC+fxz2nXC1q4izuHiV2/KkDeXGyQg0NPfAlwY5gBU8Ui
 Gf9YFXIyLWIvBU+I=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loS0w-007LXq-Vw
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=xAgXF5452HulRjyD+JrT6Ce1EM30lHGgXf0FUiEeuf8=; b=VvpK7YiNmJCX41zrA8okNEybDp
 eQ6B/no5m3jpzjv3vtsCvj/I+JC23a6uedcV8jgSiowQRskTunxDthNkfNGhTAFIlNg7Mp34lDO1v
 cJi7jUAN8r25x997QWW1iZ1s0mJEO/4TCJLBsUD/Lwvj8V5xmtHLkWqJ3/i+cAuwKhHWJJh3gK3Ih
 vP6xpGukyGIL5aEjAbdHmS9jRaDI483T3jnwPxONjWNDG4udVku6TL780C9Ec0NINGrPz5nI2nlsi
 VM1b+8ilWKuCZZyiB9PWMQ/LkZFJTj3o+rZcyBY6BUTJfo/Lky1rn8D/U1takW/WZq9JTYU9U5iTx
 ooUsJycA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loQxb-002toj-A6; Wed, 02 Jun 2021 13:31:10 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B458030029C;
 Wed,  2 Jun 2021 15:31:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 950C12016D6C5; Wed,  2 Jun 2021 15:31:04 +0200 (CEST)
Message-ID: <20210602133040.271625424@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 02 Jun 2021 15:12:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
References: <20210602131225.336600299@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [24.132.217.100 listed in zen.spamhaus.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1loS0w-007LXq-Vw
Subject: [Kgdb-bugreport] [PATCH 1/6] sched: Unbreak wakeups
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Remove broken task->state references and let wake_up_process() DTRT.

The anti-pattern in these patches breaks the ordering of ->state vs
COND as described in the comment near set_current_state() and can lead
to missed wakeups:

	(OoO load, observes RUNNING)<-.
	for (;;) {                    |
	  t->state = UNINTERRUPTIBLE; |
	  smp_mb();          ,-----> ,' (OoO load, observed !COND)
                             |       |
	                     |       |	COND = 1;
			     |	     `- if (t->state != RUNNING)
                             |		  wake_up_process(t); // not done
	  if (COND) ---------'
	    break;
	  schedule(); // forever waiting
	}
	t->state = TASK_RUNNING;

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/net/ethernet/qualcomm/qca_spi.c |    6 ++----
 drivers/usb/gadget/udc/max3420_udc.c    |   15 +++++----------
 drivers/usb/host/max3421-hcd.c          |    3 +--
 kernel/softirq.c                        |    2 +-
 4 files changed, 9 insertions(+), 17 deletions(-)

--- a/drivers/net/ethernet/qualcomm/qca_spi.c
+++ b/drivers/net/ethernet/qualcomm/qca_spi.c
@@ -653,8 +653,7 @@ qcaspi_intr_handler(int irq, void *data)
 	struct qcaspi *qca = data;
 
 	qca->intr_req++;
-	if (qca->spi_thread &&
-	    qca->spi_thread->state != TASK_RUNNING)
+	if (qca->spi_thread)
 		wake_up_process(qca->spi_thread);
 
 	return IRQ_HANDLED;
@@ -777,8 +776,7 @@ qcaspi_netdev_xmit(struct sk_buff *skb,
 
 	netif_trans_update(dev);
 
-	if (qca->spi_thread &&
-	    qca->spi_thread->state != TASK_RUNNING)
+	if (qca->spi_thread)
 		wake_up_process(qca->spi_thread);
 
 	return NETDEV_TX_OK;
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -509,8 +509,7 @@ static irqreturn_t max3420_vbus_handler(
 			     ? USB_STATE_POWERED : USB_STATE_NOTATTACHED);
 	spin_unlock_irqrestore(&udc->lock, flags);
 
-	if (udc->thread_task &&
-	    udc->thread_task->state != TASK_RUNNING)
+	if (udc->thread_task)
 		wake_up_process(udc->thread_task);
 
 	return IRQ_HANDLED;
@@ -529,8 +528,7 @@ static irqreturn_t max3420_irq_handler(i
 	}
 	spin_unlock_irqrestore(&udc->lock, flags);
 
-	if (udc->thread_task &&
-	    udc->thread_task->state != TASK_RUNNING)
+	if (udc->thread_task)
 		wake_up_process(udc->thread_task);
 
 	return IRQ_HANDLED;
@@ -1093,8 +1091,7 @@ static int max3420_wakeup(struct usb_gad
 
 	spin_unlock_irqrestore(&udc->lock, flags);
 
-	if (udc->thread_task &&
-	    udc->thread_task->state != TASK_RUNNING)
+	if (udc->thread_task)
 		wake_up_process(udc->thread_task);
 	return ret;
 }
@@ -1117,8 +1114,7 @@ static int max3420_udc_start(struct usb_
 	udc->todo |= UDC_START;
 	spin_unlock_irqrestore(&udc->lock, flags);
 
-	if (udc->thread_task &&
-	    udc->thread_task->state != TASK_RUNNING)
+	if (udc->thread_task)
 		wake_up_process(udc->thread_task);
 
 	return 0;
@@ -1137,8 +1133,7 @@ static int max3420_udc_stop(struct usb_g
 	udc->todo |= UDC_START;
 	spin_unlock_irqrestore(&udc->lock, flags);
 
-	if (udc->thread_task &&
-	    udc->thread_task->state != TASK_RUNNING)
+	if (udc->thread_task)
 		wake_up_process(udc->thread_task);
 
 	return 0;
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1169,8 +1169,7 @@ max3421_irq_handler(int irq, void *dev_i
 	struct spi_device *spi = to_spi_device(hcd->self.controller);
 	struct max3421_hcd *max3421_hcd = hcd_to_max3421(hcd);
 
-	if (max3421_hcd->spi_thread &&
-	    max3421_hcd->spi_thread->state != TASK_RUNNING)
+	if (max3421_hcd->spi_thread)
 		wake_up_process(max3421_hcd->spi_thread);
 	if (!test_and_set_bit(ENABLE_IRQ, &max3421_hcd->todo))
 		disable_irq_nosync(spi->irq);
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -76,7 +76,7 @@ static void wakeup_softirqd(void)
 	/* Interrupts are disabled: no need to stop preemption */
 	struct task_struct *tsk = __this_cpu_read(ksoftirqd);
 
-	if (tsk && tsk->state != TASK_RUNNING)
+	if (tsk)
 		wake_up_process(tsk);
 }
 




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
