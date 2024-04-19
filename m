Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE38AA835
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 19 Apr 2024 08:06:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rxhOh-0006bR-MA
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 19 Apr 2024 06:06:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1rxhOe-0006bG-81
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 Apr 2024 06:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UfGHvEVekA14khs+yrF48jXh53kWByLWlzI8vxBysTw=; b=cXwTcn7wBnhhfyKh3k4hGDuq3j
 8R55pXXSina0xlsxuOHjyhITOPIHr1k2A+I66xmQRjGj3ikZJwt+unzOkBRDQFmx4y/Lu3pZKfXXT
 tyd6EQFUe90f6hGqkTmrMHl69lcKYQaNlYBVJJAHOD+bKsEW7Upr1GAmgTu+EbQznO/k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UfGHvEVekA14khs+yrF48jXh53kWByLWlzI8vxBysTw=; b=BkY4p/T8xfo2ug0IaaeGHvH1d7
 emOJMqkUu09088rKz/k/QYCO0VH7U17+OuDhWx8MWMX4oNZPmgURhrcFkbTGz9iFyt8unId5m3s3/
 TEEFvkaoeMFrd78pAgPkIXrAAAYjrA1l1ftTDRhF5DNBTKmERIym8xRcdo18Wp/KtISg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rxhOd-0002sK-26 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 Apr 2024 06:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88AFB61508;
 Fri, 19 Apr 2024 06:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F55C072AA;
 Fri, 19 Apr 2024 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713506805;
 bh=7tvuNUi++6C8Vch6H2igX6msqCQ6YI1Wy+cuKDRDr9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z/smkLaDcQznvq3tn+/PNN/5ghdG+wSUfweoTSNE4CB6M4uWMIr3nAQ9Bch01gn5P
 87DyFHEZyTaq/cSkPwM9327vo1kYTp2ohKFDy1z6GHpYuLzTT/PFAwj4XuQmNQZncZ
 RXtp+q2gR3REq6MBYMMaPNLNSuFvLVh4nHi/+L4E=
Date: Fri, 19 Apr 2024 08:06:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <2024041915-flinch-cinema-9c22@gregkh>
References: <ac27269989394d8dac859763bc7578d6@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac27269989394d8dac859763bc7578d6@h3c.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 19, 2024 at 05:54:58AM +0000,
 Liuye wrote: > @Greg
 KH > > This issue still needs to be resolved, but I don't know how to do
 it. > Please tell me an effective strategy. How should feedback [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rxhOd-0002sK-26
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?UmXvvJpbUEFUQ0ggVjExXSBrZGI6IEZpeCB0?=
 =?utf-8?q?he_deadlock_issue_in_KDB_debugging=2E?=
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 19, 2024 at 05:54:58AM +0000, Liuye wrote:
> @Greg KH
> 
> This issue still needs to be resolved, but I don't know how to do it. 
> Please tell me an effective strategy. How should feedback be given to make it effective for you? 
> There is already an approval process for external emails in the current company. 
> And a review mechanism has been added within the team. And internal training is provided.
> The previous mentioned has been completed. What else needs to be done?

What would you want to see if you were in my position here?

Some sort of "proof" that this really is the case?  A discussion with
your company legal group about this?  A discussion with your legal group
and the open source legal community about how they have structured all
of this so that it will not happen again and a discussion about how this
did happen (i.e. a blameless post-mortum)?  A signed-off-by on your next
patch from a lawyer in that group?

In other words, what does your legal group think would be sufficient
here?

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
