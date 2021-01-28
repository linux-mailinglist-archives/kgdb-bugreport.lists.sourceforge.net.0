Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A374306A6B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Jan 2021 02:34:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4wCN-0007hK-Mp
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Jan 2021 01:34:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l4wCJ-0007gi-4Z
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 01:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S9PD//L09WdNDUy9Iw5HbDQ7xy/BLJZId+NtYoyFssE=; b=Z0DsKkL8nB87i+wjScu6X9/GpZ
 Q2TaZD2yIJgZeRuMfr+USGsjhPOkeQwOituZJM9Z1HyvAW0wAtbHChqNJsLNuejL+YJ5m1mVJJGZI
 kU3VKFk4RcwYjzCrRYH+XztB07Z8Z+o1J5gaiy+gm2RdWOaHyzMWBnjMvOQB/dFiMbek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S9PD//L09WdNDUy9Iw5HbDQ7xy/BLJZId+NtYoyFssE=; b=DNkMockyxKHBUPC+HtxwQXu5hp
 A2jjR7Arq5FGgFJfVJ5tyDWjWxls15MNZrpuc9lKU8OR+e/BgxAXaVyBuIejVyAuv/xpmAoiGfsRT
 EHFWVj0V8FDDmSoIZ8FtR7jSu2e2s7rRUJb+3/eP5jTHFq+Xrj2vrm/zp6FSNs4D7+Qs=;
Received: from mail-yb1-f177.google.com ([209.85.219.177])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4wCE-00FXzR-77
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 01:34:11 +0000
Received: by mail-yb1-f177.google.com with SMTP id r32so3940743ybd.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 17:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9PD//L09WdNDUy9Iw5HbDQ7xy/BLJZId+NtYoyFssE=;
 b=YQLMqDXCFyrtOSfJbl2G3/qBpZDImdtIdPSKwRkG3bfla9hDaAc5AtIwbCrd0d8YHQ
 xQ7bFZEExm1Dh/RvX25C2xTLZOJUwDH8JSc9/2WpbmCsclCjGR9pecBJwzxl6vaJ054x
 BOOqdxlsM/8VbYwC+iCfviuIqcF++y+6XY/TmcgcThCcVbIIGslKjIfitIwIDUlrzkJy
 p+buycbOej3NPrkW/SMp5r95GMGLhaWShL6lzbqpahiQCjE5KpSJkIWW9m7N+FK8ayoc
 4ecVs5BIvxZxEBBKC3nYBrIwgipwmTHnvV+r6PVP+thjJHNcu4HxhQTrOdK0TrQjsYI/
 j6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9PD//L09WdNDUy9Iw5HbDQ7xy/BLJZId+NtYoyFssE=;
 b=cQTdOcuW88bkQ7rbREhSewi7gOv3Bp20Rm4kUt6U1mkD2mbrM6ORZHKoIItFZM8qqD
 KH3hI7a/LAbHee2qO7lkWz81Y1RaptR37qgW8JTVPm7CTM0/8KjI5YpPTTfivAAEwr7Q
 WGWVY7ICGwQy27U11UwCaAtpjutoDIOaW9/xfnhX9uRRRDURpbd3dK1xEnU4yHPuj42K
 MqndwEHqV2YVmEu2XA5TfP1Dm3vRrpN7C3dlQtlfOZEv3G27FlJSGekVpU1QvAxdtSdj
 B9bckYTU1Joo/d2w9iafY2Rzbze9uSHsGs4Jut09+fM7r0cvntWWRGC37SqCa3h7Y3Am
 JPZg==
X-Gm-Message-State: AOAM532My4RBaGZTLgTvRR+1YNxCGcCjGeo0+Q/8+rqiSuOm3FKHDFYU
 e/d73X52+vNfn0RXnYpRmV7GPfm2I5336XoO+/s=
X-Google-Smtp-Source: ABdhPJyB7foNykxbwDfGunoZnQFy1HNMlY0qKXx9zdv09QPzJQ9p/mFtfj7eCnFXyQOQnmSpJXyFELzTVpfjWLS26IU=
X-Received: by 2002:a25:d605:: with SMTP id n5mr19869373ybg.81.1611797640621; 
 Wed, 27 Jan 2021 17:34:00 -0800 (PST)
MIME-Version: 1.0
References: <1611647709-35583-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=XV-+OrMYynkj6OjYe-xGVKM-EX69=+o6Uy=toVa4+4-Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XV-+OrMYynkj6OjYe-xGVKM-EX69=+o6Uy=toVa4+4-Q@mail.gmail.com>
From: Stephen Zhang <stephenzhangzsd@gmail.com>
Date: Thu, 28 Jan 2021 09:33:45 +0800
Message-ID: <CALuz2=daYnFyoRUfU1qn1u2Rzxdb5wK1rA2cNrVSWQfcntWGkg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.177 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.177 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4wCE-00FXzR-77
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: kdb_support: Fix debugging
 information problem
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiDkuo4yMDIx5bm0MeaciDI45pel
5ZGo5ZubIOS4iuWNiDE6MTblhpnpgZPvvJoKCj4KPiBCVFc6IGNhbiBJIGNvbnZpbmNlIHlvdSB0
byBDQyBMS01MIG9uIHlvdXIgcGF0Y2hlcz8gIFRoZQo+ICJrZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQiIGRvZXNuJ3QgZ2V0IGFyY2hpdmVkIGluIG1hbnkKPiBwbGFjZXMgKGxv
cmUua2VybmVsLm9yZyBvciBwYXRjaHdvcmspIHNvIGl0IG1ha2VzIGl0IGhhcmQgdG8gZmluZCB5
b3VyCj4gZW1haWxzIG9yIHJlZmVyIHRvIHByZXZpb3VzIGVtYWlscy4KPgoKWWVhaO+8jGkgd2ls
bCByZW1lbWJlciB0byBDQyBMS01MIG9uIG15IG5leHQgcGF0Y2guCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxp
c3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
