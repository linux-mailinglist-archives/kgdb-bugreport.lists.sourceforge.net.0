Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 984092EAC81
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Jan 2021 15:00:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwmt1-0002j3-93
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 Jan 2021 14:00:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kwmsy-0002il-W7
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 14:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GAq1kBMKi9FUQO7CIxM5mDxNd6+NNBIDSaZ8AGckt10=; b=R5c1lQseYaoK0XO1g6k1VrAbs4
 sash0yTyRTjqoGWQU9SndNmCpnnLTi8OHMTv5byltHUdyEZDpdmOjsTl5V7fmiuZGSE1bXFUFUlaj
 e9wS/QnvZIPNdSwFCI4EFHpf4ybIhEJbEL3QZoEnTYirpLpvwLktRH23GMMX+78xQSGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GAq1kBMKi9FUQO7CIxM5mDxNd6+NNBIDSaZ8AGckt10=; b=AMgzET7JAXKcNbCEJzwH/zkTKM
 KaWfIWAJnn35/1qvEIW5TbT867a+7WlY0Awb8iLALFkG/LpoQqdYOaq7aAhchY78nH6oc6EMZu4EL
 LW/7veoPA+ve7g+6eRPNAX+B36nPSTxbr7ssKtRW3ifaZbT0lnqo+szla5mvZvL52xVc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwmso-00AShz-CP
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 14:00:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F7D8229C4;
 Tue,  5 Jan 2021 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609855209;
 bh=ocyrC6aP8OkRzam8KDcWaeRpT/tK4GJHmOiU+2CWX9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0dqu7V+3IHgiRVGHUJsiJ68sxesEYcHui7b8NbjVCbyYoMbQ9BEYxTTD2isOGzno
 vC6zUCayJekf2uK5pLvHUufjNLlvnyk+H5hiRXPh4YBT64kK/kpacMctEbyNtxPI7u
 QWjbi/x/0g/R+H0gtFsfMCryXbsxuc+AG3q7cPow=
Date: Tue, 5 Jan 2021 15:01:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Defang Bo <bodefang@126.com>
Message-ID: <X/RxPSR3iQRxH+/o@kroah.com>
References: <1609120738-202321-1-git-send-email-bodefang@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609120738-202321-1-git-send-email-bodefang@126.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwmso-00AShz-CP
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: Passing ekgdbts to command
 line causes panic
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
Cc: daniel.thompson@linaro.org, arnd@arndb.de,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Dec 28, 2020 at 09:58:58AM +0800, Defang Bo wrote:
> Similar to commit<1bd54d851f50>("kgdboc: Passing ekgdboc to command line causes panic"),

Please wrap your lines, and use the correct way to reference a commit in
a changelog as documented.  It should look like:
	1bd54d851f50 ("kgdboc: Passing ekgdboc to command line causes panic")

> kgdbts_option_setup does not check input argument before passing it to strlen.
> The argument would be a NULL pointer.

What argument?

As others pointed out, your subject line does not make sense, please fix
up.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
