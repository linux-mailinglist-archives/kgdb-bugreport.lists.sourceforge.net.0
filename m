Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6559BF63
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Aug 2022 14:18:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oQ6O4-0006H4-Dl
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Aug 2022 12:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1oQ6O3-0006Ej-AK
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Aug 2022 12:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DeKLAAxbWYoZWFV4x93lLeQqUgiMWcW6CcanPBpOIxU=; b=in5pMakTNg0BT2zfB47+0vS9Q+
 60vGvzHLVmHzUC1m0ca1LFIHKFTAPBUYuvnfKLAzrZHzDaTyZuBxhoPfbvxBt171aCeS/zlfPS8NF
 64wqNNATvIKc/wBGS/cHW6ik18LWF2HiBuGML66ioxxR21ezY8lfH20MYOAywvaXbuC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DeKLAAxbWYoZWFV4x93lLeQqUgiMWcW6CcanPBpOIxU=; b=UVtrXNBVq0N5EKP8EFSn+luVbv
 2bLD6+sGhPaBHj29pfgHNbdjslw1H6PY7Imr+ApIRtutBE85RDvTsB2X8bYY0+MHGgPxb1Rh3Yu5s
 dWONO/6B58JWWC/brRa9WmL6MYOt6lnPE9smNv00NfhhsNcx5ulz1/b3W3GYJund3BNE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQ6Nv-00D7N7-Hn for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Aug 2022 12:18:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9F1FB8111B;
 Mon, 22 Aug 2022 12:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FD6C433D6;
 Mon, 22 Aug 2022 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661170698;
 bh=XFUaG+OdF42ahHuoyaxoXrWbqONRNSgJLOvnAojCSro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U/fqAf99ZA0xT0XJsyFC8OFOe2StPNMI8ydOFiWIYt0CocuQ2mPDK6nJNS3+aLtFi
 psVKfxlMSMVJHoVdgCaTiYVLwRSYTpb+R95LNrgRQuG2d7XbegW2a+zUP9iQwKuGUQ
 9VTXnVTs1n2WOyzIPfHZ29G+OWMVhqwkikZPU5A4=
Date: Mon, 22 Aug 2022 14:18:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jilin Yuan <yuanjilin@cdjrlc.com>
Message-ID: <YwN0B+CgNj6j6q6y@kroah.com>
References: <20220822120633.16753-1-yuanjilin@cdjrlc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822120633.16753-1-yuanjilin@cdjrlc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 22, 2022 at 08:06:33PM +0800, Jilin Yuan wrote:
 > Delete the redundant word 'as'. > Delete the redundant word 'the'. > >
 Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com> Your subject line is
 incorrect :( 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQ6Nv-00D7N7-Hn
Subject: Re: [Kgdb-bugreport] [PATCH] tty/seria: fix repeated words in
 comments
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

On Mon, Aug 22, 2022 at 08:06:33PM +0800, Jilin Yuan wrote:
>  Delete the redundant word 'as'.
>  Delete the redundant word 'the'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Your subject line is incorrect :(

Again, post a patch series, not a random set of patches with all the
same subject line, not reflecting what file you are touching.

I would recommend learning how the development process works first by
contributing to drivers/staging/ and not going out of that area until
you have some experience and know how to do this correctly.

good luck!

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
