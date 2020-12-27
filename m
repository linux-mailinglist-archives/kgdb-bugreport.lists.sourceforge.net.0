Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619A2E31A1
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 27 Dec 2020 16:00:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ktXWn-0003Ed-W6
	for lists+kgdb-bugreport@lfdr.de; Sun, 27 Dec 2020 15:00:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ktXWk-0003EP-M4
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Dec 2020 15:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+JxNEiB+P7H7eGFWEFV+7whg6TSLX5TBNX7hWUrquUE=; b=BWlU6Yxm9ifGM0sNMn3AfEEnKw
 mf0kigf2iyQ9p6aez0kbIverzJnmgBHX7F1MJ5lni/35j3okxs1jjDmANSuioLIe1CsJ5qq/u/d7s
 Dqs+Bk8hYJGkdAzzsByVKf9oCSpkvSarpyTLOZ+fumVlO76PPpSVJ9AIvdvz811cuAP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+JxNEiB+P7H7eGFWEFV+7whg6TSLX5TBNX7hWUrquUE=; b=iufUSsQ0N2foEWCng47AlimkUf
 rXy1eLoK9KRsTE7DHtS7+CsGpIxDF86IBfFqymqpojJ+/xowWn4fE4/ThwUE9RzziQlC4AUx1DJyd
 5S9E1+QMQeVVEQwkSG97TR1FTo7QoBFGiSd141vykZpehuTXCBcjj0w/lYuyOejBCIlw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktXWU-00Ha5s-Ke
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Dec 2020 15:00:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60E9020867;
 Sun, 27 Dec 2020 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609081181;
 bh=ZrFLsZfNoljHxg18KYAT61yF3cWJKpnoQLwPfqWvqTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mP0X1/5Wz0ylJ43FfrIDN84YO1BWuS7NCnGiJPtx2/9yhwpU7vXQQWtT3k73hui+K
 I2CZyWej+sOnWw5NVxCL2129QT+vFNSzmhiRVbbLmJMVk5dBngQmzZJ8AQw2ulLyFg
 FjMoml6ShEj/YnrXQW7evdBDNq/msJ6f/qwTlKPk=
Date: Sun, 27 Dec 2020 16:01:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Defang Bo <bodefang@126.com>
Message-ID: <X+ihsSzr3R6YB7vP@kroah.com>
References: <1609076585-4010725-1-git-send-email-bodefang@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609076585-4010725-1-git-send-email-bodefang@126.com>
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
X-Headers-End: 1ktXWU-00Ha5s-Ke
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

On Sun, Dec 27, 2020 at 09:43:05PM +0800, Defang Bo wrote:
> Similar to commit<1bd54d85>,kgdbts_option_setup does not check input argument
> before passing it to strlen. The argument would be a NULL pointer.
> 

As per the documentation, you should write commits out as 1bd54d851f50
("kgdboc: Passing ekgdboc to command line causes panic").

Can you fix that up and resend this?

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
