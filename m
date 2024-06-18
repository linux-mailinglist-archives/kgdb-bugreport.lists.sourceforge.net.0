Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A004A90DC7E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 21:33:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJeaD-0002N8-Qr
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 19:33:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJeaC-0002N1-3p
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 19:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BjbV2Qzy50FvElTGCdfHDo5Cwkx902dlsw8DvDAu3gM=; b=VukL6GkDuo13qNspmsTPaZLFw2
 PP2RojJ00/Y+77d9jGPaqtR+uthW8pQrGuEW1vlo56IYElCbLuq2y8fPPW5ufrMGGFqOL6P4yMpOI
 Q8dfxY0Bemhb60Xa3ohMJ5Xn6vBJ5cCAB9kEbYXFCKkH7Oy+f7tCky6M2FDYoUylX1Cw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BjbV2Qzy50FvElTGCdfHDo5Cwkx902dlsw8DvDAu3gM=; b=RXsca5onw/BcIc7zj5oLWc+k1R
 WMIYs6NKql3ltEgOdjz9EEbZg3CDacIMX8zd3tCdEHRwcLDBfgQvkLFtU8AbCzOZjhsAEk3CkUy3h
 mrSpVen2EljQikG5RYsQfV16CzGlccFgbF8hq6nI79JJCh6yIGNWod/P0lzVob5FnqaI=;
Received: from mail-qk1-f174.google.com ([209.85.222.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJeaC-00046b-Fh for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 19:33:32 +0000
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7960454db4fso339616185a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 12:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718739204; x=1719344004;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjbV2Qzy50FvElTGCdfHDo5Cwkx902dlsw8DvDAu3gM=;
 b=lv2A0zVbsN90F8Ydu6xSr4qPX4/VPPnV/LC5VgWGr/E0EL2NC1UGERIi8BFJ86iIrk
 sYHgehSq0HIgnOjd36kTkXXffy1GEdHyQsCXXMyymzy5sd2tzzpXXj2JyeSuX4Kr/AwC
 kcSR+ioUYupUIZRy9K5Jbg6WfkZKeGHesVuTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718739204; x=1719344004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjbV2Qzy50FvElTGCdfHDo5Cwkx902dlsw8DvDAu3gM=;
 b=kU1NCZxBEjNAXK5PvA7kFbB1trxfkUd5U8SOvczM/mVcik51vA9sfgM2ubPNk21fuY
 hAeeCn7uPN5fv2Q2+TDrhYKwsNGjFp2sGGo3P42WE6NqNWTrsjdexAKp/1FTuGY64npY
 kRBdx3eXUuxFrG3JxDTeHuru2cb71bS2jCIuWG6sQ5DnQGwN9S9m8sw4CUWgx87I3cYL
 bGFB9n59zQqFgf0DOgIIiQ9Xnz/7+iy62UQP0cUTbWmR2PsMZRhNFwgC65m0QRJOclpe
 GZeS8/DCKZYnq7UlYXWM2HPYznWXMK3nhDzspzm6BumGFuD7Scw/C9Eg+wUwnImrI3QK
 Llpg==
X-Gm-Message-State: AOJu0YxG3ZXqpk/csx5QMgGfOsKzK3eiK3qSPXqtN1AJ/RFUuTrYF9fD
 6EvCyE3q2WWRrpexs+wAwrzDRotXtN8aPUkL1Bx85gHwkc/4HuBRAH2HAv/7ohmnm3vOWu+hW80
 =
X-Google-Smtp-Source: AGHT+IGdvY0crcYVmTtg35Jz3hbKhIANAliuPJUWJRlrzGTc6/qrMSzzj4Sk6T+f4TgNmDFCzQH7cA==
X-Received: by 2002:a0c:f9c5:0:b0:6b0:6a57:c982 with SMTP id
 6a1803df08f44-6b501e38f7emr6016046d6.28.1718739204518; 
 Tue, 18 Jun 2024 12:33:24 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5bf1f69sm68872666d6.17.2024.06.18.12.33.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 12:33:23 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-443580f290dso60851cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 12:33:23 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:442:1bc4:8fb2 with SMTP id
 d75a77b69052e-444a8fcee3cmr465821cf.20.1718739203008; Tue, 18 Jun 2024
 12:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.13.I572fb3cf62fae1e728dd154081101ae264dc3670@changeid>
 <20240618155938.GG11330@aspen.lan>
In-Reply-To: <20240618155938.GG11330@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 12:33:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTegKBcHY9pgfFUs7T1Ug5r1yg+CxLE6sBhBBt4csfkw@mail.gmail.com>
Message-ID: <CAD=FV=VTegKBcHY9pgfFUs7T1Ug5r1yg+CxLE6sBhBBt4csfkw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Jun 18, 2024 at 8:59 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Mon, Jun 17, 2024 at 05:34:47PM -0700, Douglas Anderson wrote:
    > > Add commands that are like the other "md [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.222.174 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.222.174 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.222.174 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.174 listed in wl.mailspike.net]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJeaC-00046b-Fh
Subject: Re: [Kgdb-bugreport] [PATCH 13/13] kdb: Add mdi,
 mdiW / mdiWcN commands to show iomapped memory
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIEp1biAxOCwgMjAyNCBhdCA4OjU54oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAy
NCBhdCAwNTozNDo0N1BNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gQWRkIGNv
bW1hbmRzIHRoYXQgYXJlIGxpa2UgdGhlIG90aGVyICJtZCIgY29tbWFuZHMgYnV0IHRoYXQgYWxs
b3cgeW91Cj4gPiB0byByZWFkIG1lbW9yeSB0aGF0J3MgaW4gdGhlIElPIHNwYWNlLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4K
Pgo+IFNvcnJ5IHRvIGJlIHRoZSBiZWFyZXIgb2YgYmFkIG5ld3MgYnV0Li4uCj4KPgo+ID4gLS0t
Cj4gPiA8c25pcD4KPiA+ICsvKgo+ID4gKyAqIGtkYl9nZXRpb3dvcmQKPiA+ICsgKiBJbnB1dHM6
Cj4gPiArICogICB3b3JkICAgIFBvaW50ZXIgdG8gdGhlIHdvcmQgdG8gcmVjZWl2ZSB0aGUgcmVz
dWx0Lgo+ID4gKyAqICAgYWRkciAgICBBZGRyZXNzIG9mIHRoZSBhcmVhIHRvIGNvcHkuCj4gPiAr
ICogICBzaXplICAgIFNpemUgb2YgdGhlIGFyZWEuCj4gPiArICogUmV0dXJuczoKPiA+ICsgKiAg
IDAgZm9yIHN1Y2Nlc3MsIDwgMCBmb3IgZXJyb3IuCj4gPiArICovCj4gPiAraW50IGtkYl9nZXRp
b3dvcmQodW5zaWduZWQgbG9uZyAqd29yZCwgdW5zaWduZWQgbG9uZyBhZGRyLCBzaXplX3Qgc2l6
ZSkKPiA+ICt7Cj4gPiArICAgICB2b2lkIF9faW9tZW0gKm1hcHBlZCA9IGlvcmVtYXAoYWRkciwg
c2l6ZSk7Cj4KPiBpb3JlbWFwKCkgaXMgYSBtaWdodF9zbGVlcCgpIGZ1bmN0aW9uLiBJdCdzIHVu
c2FmZSB0byBjYWxsIGl0IGZyb20gdGhlCj4gZGVidWcgdHJhcCBoYW5kbGVyLgoKSG1tbW0uIERv
IHlvdSBoYXZlIGEgcG9pbnRlciB0byBkb2N1bWVudGF0aW9uIG9yIGNvZGUgc2hvd2luZyB0aGF0
Cml0J3MgYSBtaWdodF9zbGVlcCgpIGZ1bmN0aW9uLiBJIHdhcyB3b3JyaWVkIGFib3V0IHRoaXMg
aW5pdGlhbGx5IGJ1dApJIGNvdWxkbid0IGZpbmQgYW55IGRvY3VtZW50YXRpb24gb3IgY29kZSBp
bmRpY2F0aW5nIGl0IHRvIGJlIHNvLiBJCmFsc28gZ290IG5vIHdhcm5pbmdzIHdoZW4gSSByYW4g
bXkgcHJvdG90eXBlIGNvZGUgYW5kIHRoZW4gdGhlIGNvZGUKd29ya2VkIGZpbmUsIHNvIEkgYXNz
dW1lZCB0aGF0IGl0IG11c3Qgc29tZWhvdyB3b3JrLiBTaWdoLi4uCgpMb29raW5nIG1vcmUgY2xv
c2VseSwgbWF5YmUgdGhpcyBpczoKCmlvcmVtYXAoKSAtPiBpb3JlbWFwX3Byb3QoKSAtPiBnZW5l
cmljX2lvcmVtYXBfcHJvdCgpIC0+Cl9fZ2V0X3ZtX2FyZWFfY2FsbGVyKCkgLT4gX19nZXRfdm1f
YXJlYV9ub2RlKCkgLT4gX19nZXRfdm1fYXJlYV9ub2RlKCkKCi4uLmFuZCB0aGF0IGhhcyBhIGtl
cm5lbCBhbGxvY2F0aW9uIHdpdGggR0ZQX0tFUk5FTD8KCkkgZ3Vlc3MgaXQgYWxzbyB0aGVuIGNh
bGxzIGFsbG9jX3ZtYXBfYXJlYSgpICB3aGljaCBoYXMgbWlnaHRfc2xlZXAoKS4uLgoKSSdsbCBo
YXZlIHRvIHRyYWNrIGRvd24gd2h5IG5vIHdhcm5pbmdzIHRyaWdnZXJlZC4uLgoKPiBJJ20gYWZy
YWlkIEkgZG9uJ3Qga25vdyBhIHNhZmUgYWx0ZXJuYXRpdmUgZWl0aGVyLiBNYWNoaW5hcnkgc3Vj
aCBhcwo+IGttYXBfYXRvbWljKCkgbmVlZHMgYSBwYWdlIGFuZCBpb21lbSB3b24ndCBoYXZlIG9u
ZS4KClVnaC4gSXQgd291bGQgYmUgbmljZSB0byBjb21lIHVwIHdpdGggc29tZXRoaW5nIHNpbmNl
IGl0J3Mgbm90CnVuY29tbW9uIHRvIG5lZWQgdG8gbG9vayBhdCB0aGUgc3RhdGUgb2YgaGFyZHdh
cmUgcmVnaXN0ZXJzIHdoZW4gYQpjcmFzaCBoYXBwZW5zLiBJbiB0aGUgcGFzdCBJJ3ZlIG1hbmFn
ZWQgdG8gZ2V0IGludG8gZ2RiLCB0cmFjayBkb3duIGEKZ2xvYmFsIHZhcmlhYmxlIHdoZXJlIHNv
bWVvbmUgaGFzIGFscmVhZHkgbWFwcGVkIHRoZSBtZW1vcnksIGFuZCB0aGVuCnVzZSBnZGIgdG8g
bG9vayBhdCB0aGUgbWVtb3J5LiBJdCdzIGFsd2F5cyBhIGJpZyBwYWluLCB0aG91Z2guLi4KCi4u
LmV2ZW4gaWYgSSBjb3VsZCBqdXN0IGxvb2sgdXAgdGhlIHZpcnR1YWwgYWRkcmVzcyB3aGVyZSBz
b21lb25lIGVsc2UKaGFkIGFscmVhZHkgbWFwcGVkIGl0IHRoYXQgbWlnaHQgYmUgZW5vdWdoLiBB
dCBsZWFzdCBJIHdvdWxkbid0IG5lZWQKdG8gZ28gdHJhY2sgZG93biB0aGUgZ2xvYmFscyBteXNl
bGYuLi4KCi4uLmFueXdheSwgSSBndWVzcyBJJ2xsIHBvbmRlciBvbiBpdCBhbmQgcG9rZSBpZiBJ
IGhhdmUgdGltZS4uLgoKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
