Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A89B86F279
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  2 Mar 2024 22:04:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rgWX9-0001MN-OQ
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 02 Mar 2024 21:04:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1rgWX7-0001MH-Gn
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 02 Mar 2024 21:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uORoj+aCZMJXyq3QBV5PLg2nAJwWO3vSilNvdbM03yg=; b=Rn7hiOpEYe6DNsI/sUm1b6BQfP
 s+jddijxsH9FG+wo5srPLhWW5YMxsCyiZG5lhmy4Q/BAkaghQjhtE4NwFhCBiXRA961UoRCQ1fmGe
 zDXjeoeSQonSE+KXZOzXpfZQv9G7tsVr3KNTK6P9XBVu61VT0dJym8uMB2188SUcLLU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uORoj+aCZMJXyq3QBV5PLg2nAJwWO3vSilNvdbM03yg=; b=ISIC8H3PGnV+PXdmnZVeAOI9Z6
 UeMuARG+X+vdmc+c6bb7JsTIBk419T+c59F1mhPF/c1IO6TKoqO6CnJSk5Yl3SIJth1Qjx/N9e2jP
 VWy6t0rrdiNnXR1/vSTlD6C4iN3fEqNjD2Z35QPVJnbwY+KlwfVN1Kam15mtzxpfQuoo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rgWWx-0002Ck-GU for kgdb-bugreport@lists.sourceforge.net;
 Sat, 02 Mar 2024 21:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9481E6166F;
 Sat,  2 Mar 2024 20:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB135C433C7;
 Sat,  2 Mar 2024 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1709412284;
 bh=uORoj+aCZMJXyq3QBV5PLg2nAJwWO3vSilNvdbM03yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L/LvDSM5zXtA1zDYO1QrOKvlS8yGL1sPbyV/Kedojm7aSq8eVUcACWfEhF5HlLkmR
 gkPfKaEx/XA9oTAChO/sWZS6LQLx5cysKjbGrAfrytYtL9YwHjiphuxpCVDn8GTQMY
 CRqVAI2/kGxEm4woJwj5zWZbOGB5Y3XxrNIyC5zQ=
Date: Sat, 2 Mar 2024 21:44:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: LiuYe <liu.yeC@h3c.com>
Message-ID: <2024030232-verbalize-eggnog-f04a@gregkh>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228025602.3087748-1-liu.yeC@h3c.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 28, 2024 at 10:56:02AM +0800, LiuYe wrote: > This
 e-mail and its attachments contain confidential information from New H3C,
 which is > intended only for the person or entity whose address [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rgWWx-0002Ck-GU
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix the deadlock issue in KDB
 debugging.
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Feb 28, 2024 at 10:56:02AM +0800, LiuYe wrote:
> This e-mail and its attachments contain confidential information from New H3C, which is
> intended only for the person or entity whose address is listed above. Any use of the
> information contained herein in any way (including, but not limited to, total or partial
> disclosure, reproduction, or dissemination) by persons other than the intended
> recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender
> by phone or email immediately and delete it!

Now deleted.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
