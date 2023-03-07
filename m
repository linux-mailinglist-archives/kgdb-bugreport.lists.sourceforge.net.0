Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 894206AE37D
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Mar 2023 15:57:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pZYl7-0001c9-8J
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 07 Mar 2023 14:57:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1pZYl6-0001c2-Dn
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 14:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w8+EzahA83lj0vvgc4T6aoeohBhGMZ0V3jf0tKhZCc8=; b=Wo10aJXxe2AasIEBhWZVVkfOmM
 eKBg6+jruBIFyDHvaUNVthi0T4YAi8Rv7r9vxIFafG4YkkWLYyHKNGYPRmdglLjagghPw11kbMivT
 nsojWs4y3qPRzJ3W82wevTrYvujGYuOkKkuO/RoT9Hi/196xfLkX4+bzfiV9+Hl96ZY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w8+EzahA83lj0vvgc4T6aoeohBhGMZ0V3jf0tKhZCc8=; b=kBGkmiyPR+OYt3wSYsv8mLSV5l
 c/hgckHVf/Jw2+yAw7DHAZ46iCF6PDMfZ34J8yo4Yx0QJgTCKktUuBqzZL+TUA1u5r3lKe56zJqm1
 xxT1lVH5HWUSdACcqbgFeknqWk9O6ITZaDv/uNehdfhzu1tiCx+jRhRJpHS1pGKQTc5w=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pZYl1-0004LT-QW for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 14:57:44 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 18EDA218F3;
 Tue,  7 Mar 2023 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678201051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w8+EzahA83lj0vvgc4T6aoeohBhGMZ0V3jf0tKhZCc8=;
 b=SzjR3puHi6uNNxxOUkuB0+T/XlT/X6PTY9nmwYAjLNrpCyD+eG65S8vP+mAerNT5KPUbhx
 xOlMBfknMY32N7H81m7qpCGy7T3optTvs1gjGWQhA5/SZwAsJYhB+3VnImf3pPFFVNyDlU
 u+ad//NcYrdy2FzhondG4ZSoaG+cwqo=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 45A1A2C141;
 Tue,  7 Mar 2023 14:57:30 +0000 (UTC)
Date: Tue, 7 Mar 2023 15:57:24 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <ZAdQ1CLMkq6CULp0@alley>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <20230302195618.156940-2-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302195618.156940-2-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-03-02 21:02:01,
 John Ogness wrote: > It is allowed
 for consoles to provide no write() callback. For > example ttynull does this.
 > > Check if a write() callback is available before using i [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pZYl1-0004LT-QW
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 01/18] kdb: do not assume
 write() callback available
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2023-03-02 21:02:01, John Ogness wrote:
> It is allowed for consoles to provide no write() callback. For
> example ttynull does this.
> 
> Check if a write() callback is available before using it.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
