Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C830D8AF
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Feb 2021 12:31:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7GNV-0002e3-EG
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Feb 2021 11:31:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l7GNU-0002dw-D8
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 11:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2TvELHK3+980BnYnCawCvHo8YLq3tuWoHqkA5zf+rqg=; b=dWpZ6uwPgh8p3xC5iI6lvod4br
 IjyoOH0gpzu/7Q4Y9RR4h6z80F1Ky2HeWhYxsMtbB2wuTyy0XbU2rCb2KeLC9ddG1z9v8Av4WRDwV
 uat3/u3W8vfY5xEfjWE6mZAGeTGvdMJB7Zrp7fRJRQgJgd5LtYbR1EqybdRHi4oPPDts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2TvELHK3+980BnYnCawCvHo8YLq3tuWoHqkA5zf+rqg=; b=kDaZU4sI+ckNyu5ogFbMeAWVyu
 JeokvYBPSW1ofBYKI0M1d25sGMLwPsdA1cyt3UZXeHQ1hoWH8ASCYAE9yn9fcqhJkdP7ON/g3LqXe
 nEtlOrhfhZVwBdXQubtJ4k/IYUm1LfvlOEb+uhVR8eh2Gmo/A1biBl2OXSBWzzT7DksE=;
Received: from mail-yb1-f176.google.com ([209.85.219.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l7GNM-0001DR-2b
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 11:31:20 +0000
Received: by mail-yb1-f176.google.com with SMTP id j84so10436032ybg.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Feb 2021 03:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2TvELHK3+980BnYnCawCvHo8YLq3tuWoHqkA5zf+rqg=;
 b=u9fdNrAzWahqua1Xu0QhP7k/O/GMF2IpNNmpAku/eidW6f0whHYb4eJKqxrI2Q4eba
 T8jO4OXhfSsRrVoosRqEh/7gujn/UeQD8Z3yfqNCgO8OS5yHAPTjvOINu5sE19L3f1KG
 5/wHMsW3gPGLw0N3r6o4ZEhUzH7MIPvozPlk8wLP9UYrw4zj4yJW4nFkNRfGPgOGL9ju
 qCG9/2shd8XyANJ3ezuCLl0vowUzDDwDrnLsBkD4MtKCB02hKkEYydCj3/N37eii3B69
 72Flq6c/OZnRM5qGJQgqLzbN/OqzN3GYk6g+imKvgU91OC0GGmmVg5Ob6aYPh50yurny
 1glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2TvELHK3+980BnYnCawCvHo8YLq3tuWoHqkA5zf+rqg=;
 b=YGp6cqYVlBb/IkxsviqwzulCZkAoDYbKlXyFtb/2t8iodvaQjaXjdCHDps+YKvz36x
 D6UjtzznEwFCmz2rqSWS3ePT+hPVgskJATNXvg8sGFFtTBGESvyy0KdsTbLjHRF2aT4Q
 M835FE/IeX30rq00JLcZaBZiKkSPaeaWqMw+J2XTxDiCfhRhoIjWol2oX+NifKTLn1BF
 OAh8Ni8P+GDvIafy+MCQJaNgKLzrL1qEk54TdJ4xt7OuOuSGpvA4PPCC+5ymIy3D8RQx
 Ow618ztaKEcXLACo6ACMOqFnm7AyttMzLeDGNCCLK4vvsUnjkCeypYwie9AMhKeWZTdk
 QDpw==
X-Gm-Message-State: AOAM532a2Ke+5L6Vjgdf7tu2uXLgC5xvtPI5f+SpIMYrwoWsYyfuiSVy
 i41ThEMi829MEcxZ23fZe3Guuek80HM7EjmiW/Y=
X-Google-Smtp-Source: ABdhPJzaHL0RSoP2Fu74i6x70pd5cQC+jtzvW4iUJjHF1uOPOtCDdaCXKMVHr3ObAg59iPQ+HAbNbUr8Xb5Z/MUi0I8=
X-Received: by 2002:a25:8385:: with SMTP id t5mr3627668ybk.81.1612351866472;
 Wed, 03 Feb 2021 03:31:06 -0800 (PST)
MIME-Version: 1.0
References: <1612005840-4342-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=WQ7iCQFf6Qb3agM4DCt_Df3c6BwV_T6tEMMxXArbY_5A@mail.gmail.com>
 <CALuz2=erXGa2q_ODOpARK9yb_GQo0nOLWnP-PuBMCc+pv8Cp4Q@mail.gmail.com>
 <CAD=FV=Xcywabh3U0=hzd8DXR2gdwLBEFsbwLof7Y6LMu+ViPNA@mail.gmail.com>
In-Reply-To: <CAD=FV=Xcywabh3U0=hzd8DXR2gdwLBEFsbwLof7Y6LMu+ViPNA@mail.gmail.com>
From: Stephen Zhang <stephenzhangzsd@gmail.com>
Date: Wed, 3 Feb 2021 19:30:55 +0800
Message-ID: <CALuz2=cApyqB2FWvf8GVhAtGJrBGVWxTvQmiiOFUN+zouqZOUA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.176 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l7GNM-0001DR-2b
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: kdb_support: Fix debugging
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
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiDkuo4yMDIx5bm0MuaciDPml6Xl
kajkuIkg5LiK5Y2IMTo0MOWGmemBk++8mgoKPiA8dGFiPmtkYl9kYmdfcHJpbnRmKEFSLCAicmV0
dXJucyBbLi4uXSAoJXMpXG4iLAo+IDx0YWI+PHRhYj4gICAgICAgcmV0LCBzeW10YWItPnN5bV9z
dGFydCwgWy4uLl0sIHN5bXRhYi0+c3ltX25hbWUpOwo+CgpUaGFuayB5b3UgZm9yIHRoZSBkZXRh
aWxlZCBleHBsYW5hdGlvbi4gSW4gdGhpcyBjYXNlLCBTaG91bGRuJ3QgdGhlICJyZXQiCmJlIHVu
ZGVyCnRoZSAiKEFSIj8gbGlrZSBiZWxvdzoKCjx0YWI+a2RiX2RiZ19wcmludGYoQVIsICJyZXR1
cm5zIFsuLi5dICglcylcbiIsCjx0YWI+PHRhYj4gICAgICAgICAgICAgICByZXQsIHN5bXRhYi0+
c3ltX3N0YXJ0LCBbLi4uXSwgc3ltdGFiLT5zeW1fbmFtZSk7CgogU2VlCjwKaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvaHRtbC92NS4xMC9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1sI2JyZWFr
aW5nLWxvbmctbGluZXMtYW5kLXN0cmluZ3MKPgp3aGVyZSBpdCBzYXlzICJBIHZlcnkgY29tbW9u
bHkgdXNlZCBzdHlsZSBpcyB0byBhbGlnbiBkZXNjZW5kYW50cyB0byBhCmZ1bmN0aW9uIG9wZW4g
cGFyZW50aGVzaXMiLgpUaGUgImRlc2NlbmRhbnRzIiBoZXJlIG1lYW5zIHRoZSBuZXh0IGxpbmUs
IHJpZ2h0PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
S2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2Ri
LWJ1Z3JlcG9ydAo=
