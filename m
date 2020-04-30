Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D091C0326
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 18:52:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUCQF-0006wJ-AP
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 16:52:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jUCQE-0006w2-3X
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K97avfoeCpwqqRxczE/kgPhFRPB8stz3Bwyv+/AM2T8=; b=CVyZxPuuQaqfmlQb3WsZHAiagC
 1v5hYlYoXERwyCQ849OeK5mY3xhI4pKuNJp0xt6wJ4iZd0dUFC0wHAV37ilt5k/fFuv99WAqTPXZg
 hV5wpIuS9BqQ9V/gMyg35OSCNAubYAr3jhAOVz1cPDANr8KhFrtMTXuoE4n+a45vO7FM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K97avfoeCpwqqRxczE/kgPhFRPB8stz3Bwyv+/AM2T8=; b=hPFkuQW2kP1WM0yJXMtBSSrb55
 g0OAsMoAhWN0INhG1DngO15XNiBtU7BQgaqHRsV6jDC3Z4ZKCnkws8BgLPTy1gujZECHqk8cnrfK8
 ggywfXdlhmSw3YGHnRJN/8S5/FaClxZPz7ji0QTYYOy9WwrX0HADb/oPtTVWpOQ+EVOY=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUCQ8-003Wi5-Q5
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:52:26 +0000
Received: by mail-wm1-f67.google.com with SMTP id e26so2692823wmk.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K97avfoeCpwqqRxczE/kgPhFRPB8stz3Bwyv+/AM2T8=;
 b=c7iGYC6aTaq/bUXK/PKUTdBfsgEtPpXBsoGt1XDiXh2TmNu0ggeTc1w2hEhZmS9EE3
 2v4t3dVxrm2Kz/i74Xpsksg1ikalHbDQoUUp630dSotrtru18+Exxr3SuTDRo49dD3xK
 INnK9nalt5lYXL6xHFUDY7zC4IJP6L0EiO6PolTRFUHZl/KIp8TKnllJMw+saaIP5zbJ
 lq+LoOy3MllKxIMjHSnEPfx1mZHlDXSJlRIjafFazhwxhCRdWC/s+sLmH2Yl11x6K1/u
 IHBiXgiznmndzRcrjMHp6ckVwkTOJnoZQB7krYp1RgW4VzUmaAS6z8p8+DMDCL3ZmYjS
 HK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K97avfoeCpwqqRxczE/kgPhFRPB8stz3Bwyv+/AM2T8=;
 b=jRlUTLmZBnhCCf9zNOzP5OVHdsFYGQhF1xDsVWk+fEVKyw5C0Fmgw/W9ugeerX0doe
 ZaOK4CG/8Wp7rT5jd+v1LSGcvCCBr15LW6Sm9gFuG34dLSsp30cso9bKFni83CiWOF6c
 IrweAyBGBVZhJa4x2HlkCcpTVbuOPOXey8B/yvRJTA7ccbKNZlPrdx9uySTa6UPufNNZ
 EVsh3OyKvS3c0R735RRf8Ck1pSagbDbUd9eylet6wpsn2PVlKzSQod7CQcxfuy29FeyY
 CV37JTj3lovb16DZ0tHVibCL+KqruVWgFm2YrvSsDQE79v58lk7dNkR9d1jZmdHTZvOQ
 RVyg==
X-Gm-Message-State: AGi0Pua0Jvw6yTuySDEfQ9aKaKVxFmzg0QZQMbDVmHzoKFoh1HSqLAMI
 71eDbx235RJ/s4ezikoG2LgCjw==
X-Google-Smtp-Source: APiQypJPfxiBLqtR94rFFnxprsJ8BntAXmdItGqwpn9asW3IBEl2ZJjz+8gJBtPazBl+AkaL7bkWpA==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr3961982wmd.88.1588265530909;
 Thu, 30 Apr 2020 09:52:10 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z10sm410920wrg.69.2020.04.30.09.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 09:52:10 -0700 (PDT)
Date: Thu, 30 Apr 2020 17:52:08 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200430165208.7btqnsygf7kn3cso@holly.lan>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.6.I89de39f68736c9de610e6f241e68d8dbc44bc266@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428141218.v3.6.I89de39f68736c9de610e6f241e68d8dbc44bc266@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUCQ8-003Wi5-Q5
Subject: Re: [Kgdb-bugreport] [PATCH v3 06/11] kgdb: Prevent infinite
 recursive entries to the debugger
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
Cc: catalin.marinas@arm.com, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, bp@alien8.de, linux-serial@vger.kernel.org,
 gregkh@linuxfoundation.org, jslaby@suse.com, tglx@linutronix.de,
 will@kernel.org, mingo@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 28, 2020 at 02:13:46PM -0700, Douglas Anderson wrote:
> If we detect that we recursively entered the debugger we should hack
> our I/O ops to NULL so that the panic() in the next line won't
> actually cause another recursion into the debugger.  The first line of
> kgdb_panic() will check this and return.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
