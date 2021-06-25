Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0E3B4158
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Jun 2021 12:18:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lwiuO-0005Oq-5j
	for lists+kgdb-bugreport@lfdr.de; Fri, 25 Jun 2021 10:18:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1lwiuM-0005Oh-5S
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Jun 2021 10:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jALFPjRX7zmv4IaxqKcDCAGnMESxdAZTzVd8QAUHx90=; b=g5Dz52TISdinlkfMoGz0M3oKMT
 xTum4l3aKzKCwiWGo/mc+1Hqo+apcH0j5L9n3j+0r7BAJBBdIWTtF/WCHcF4qshhe69oGX+dKUrkp
 aJLCfJm4SLvCjfbE4wuA7NHaMeYVlzTpyWXq1Pcwj2fVy/iXwigtB6Y3WEpHH88q7SvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jALFPjRX7zmv4IaxqKcDCAGnMESxdAZTzVd8QAUHx90=; b=Q
 RQFCR+ZqvSE6Q1GMvqSFh5sGCjArIHZDaQgTfBbhrFz1K/jvhEp/P7acstej/+NCxwW0I1agiet23
 bZN5xxrofKaYrlQ76byeJm9eEmRM5UjRgP9hyp0aZ9HbvMnlTnmDWZ5tf/pjI/Ydeyy6gU6KH7wvz
 zY+hbS8cRCaJsaug=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lwiuC-0005D9-R8
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Jun 2021 10:18:00 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PAAQ1N021247; Fri, 25 Jun 2021 10:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=jALFPjRX7zmv4IaxqKcDCAGnMESxdAZTzVd8QAUHx90=;
 b=t+4+PAG7yVeSg6rSI8kmI2bKJhZ/KiZtdQhx3rcmjWIoo+HMv+KW5ct7+fKvIXUsY4vi
 z3bsUhbq9e4IRGHLCiqtXTzCWvJmQCvzM/OukdkItf00ZyYVmlN2Fk07ttKqtoRKNEvo
 aGllO3XtIwilHxRsAHsO8PlVhckd1T/88t1g7v3Z+xJqPr3aQk5wact0/ft3ORBBLMii
 ea9wQlQlsX9y3PLW2DaMDynmgcDZy/n8E8/AClX32jX4oxZQudhzj0nx0/9IXLYEBiya
 OedEQ/yA8QhCOGxxs3Tk0st1AEfrlQkwhRw8TkwIyDKCOvwcrEjrnlp0NeAP6tlbd7Fa AA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39d27es19t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 10:17:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15PA9l23012219;
 Fri, 25 Jun 2021 10:17:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 39d2py04d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 10:17:38 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15PAHbvl035495;
 Fri, 25 Jun 2021 10:17:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 39d2py04cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 10:17:37 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15PAHUeJ008344;
 Fri, 25 Jun 2021 10:17:36 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 25 Jun 2021 10:17:30 +0000
Date: Fri, 25 Jun 2021 13:17:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: peterz@infradead.org
Message-ID: <YNWtNFCWBsCjKm3i@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-GUID: tEKiSjrNMOGuR0iGMuajcs8LozRx2Bwk
X-Proofpoint-ORIG-GUID: tEKiSjrNMOGuR0iGMuajcs8LozRx2Bwk
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.2 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lwiuC-0005D9-R8
Subject: [Kgdb-bugreport] [bug report] sched: Change task_struct::state
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
Cc: kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello Peter Zijlstra,

The patch 2f064a59a11f: "sched: Change task_struct::state" from Jun
11, 2021, leads to the following static checker warning:

	kernel/debug/kdb/kdb_support.c:624 kdb_task_state_char()
	warn: unsigned 'p_state' is never less than zero.

kernel/debug/kdb/kdb_support.c
   610  char kdb_task_state_char (const struct task_struct *p)
   611  {
   612          unsigned int p_state;
                ^^^^^^^^^^^^^^^^^^^^

   613          unsigned long tmp;
   614          char state;
   615          int cpu;
   616  
   617          if (!p ||
   618              copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
   619                  return 'E';
   620  
   621          cpu = kdb_process_cpu(p);
   622          p_state = READ_ONCE(p->__state);
   623          state = (p_state == 0) ? 'R' :
   624                  (p_state < 0) ? 'U' :
                         ^^^^^^^^^^^
Impossible

   625                  (p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
   626                  (p_state & TASK_STOPPED) ? 'T' :
   627                  (p_state & TASK_TRACED) ? 'C' :
   628                  (p->exit_state & EXIT_ZOMBIE) ? 'Z' :
   629                  (p->exit_state & EXIT_DEAD) ? 'E' :
   630                  (p_state & TASK_INTERRUPTIBLE) ? 'S' : '?';
   631          if (is_idle_task(p)) {
   632                  /* Idle task.  Is it really idle, apart from the kdb
   633                   * interrupt? */
   634                  if (!kdb_task_has_cpu(p) || kgdb_info[cpu].irq_depth == 1) {
   635                          if (cpu != kdb_initial_cpu)
   636                                  state = 'I';    /* idle task */
   637                  }
   638          } else if (!p->mm && state == 'S') {
   639                  state = 'M';    /* sleeping system daemon */
   640          }
   641          return state;
   642  }

regards,
dan carpenter


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
